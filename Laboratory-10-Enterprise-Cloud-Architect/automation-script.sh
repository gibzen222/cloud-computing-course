#!/usr/bin/env bash
# =====================================================================
# automation-script.sh
# CloudNova Technologies - Backup + Health Report for WordPress/MySQL
#
# What it does (disaster recovery / operations):
#   1. Health check  : stops if the database container is not running,
#                      and logs container status and disk usage.
#   2. Database dump : mysqldump of the WordPress database, gzipped.
#   3. Files backup  : tar.gz of the wp_data volume (themes, plugins, uploads).
#   4. Retention     : deletes backups older than RETENTION_DAYS.
#   5. Logging       : everything is written to $BACKUP_DIR/backup.log.
#
# Manual run : ./automation-script.sh
# Scheduled  : cron, every day at 02:00 (see operational-manual.md)
#   0 2 * * * /full/path/automation-script.sh >> $HOME/backups/cron.log 2>&1
# =====================================================================
set -euo pipefail

# ---------- settings (change here if your names differ) ----------
BACKUP_DIR="${BACKUP_DIR:-$HOME/backups}"
DB_CONTAINER="cloudnova-db"
WP_VOLUME="cloudnova_wp_data"
RETENTION_DAYS=7
STAMP="$(date +%F_%H-%M-%S)"
LOG_FILE="$BACKUP_DIR/backup.log"

# cron runs with a very small PATH, so set a safe one
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

mkdir -p "$BACKUP_DIR"

log() {
  echo "[$(date '+%F %T')] $*" | tee -a "$LOG_FILE"
}

log "===== Backup started on $(hostname) ====="

# ---------- 1. health check ----------
if ! docker ps --format '{{.Names}}' | grep -qx "$DB_CONTAINER"; then
  log "ERROR: container $DB_CONTAINER is not running. Backup aborted."
  exit 1
fi

log "Container status:"
docker ps --format '   {{.Names}} - {{.Status}}' | tee -a "$LOG_FILE"
log "Disk usage on / : $(df -h / | awk 'NR==2 {print $5}') used"

# ---------- 2. database dump ----------
# The password is read INSIDE the container from its own environment,
# so no password is written in this script.
DB_FILE="$BACKUP_DIR/db_${STAMP}.sql.gz"
docker exec "$DB_CONTAINER" sh -c \
  'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --single-transaction --no-tablespaces "$MYSQL_DATABASE"' \
  | gzip > "$DB_FILE"

if [ ! -s "$DB_FILE" ]; then
  log "ERROR: database backup is empty: $DB_FILE"
  exit 1
fi
log "Database backup saved: $DB_FILE ($(du -h "$DB_FILE" | cut -f1))"

# ---------- 3. WordPress files backup ----------
FILES_NAME="wp_files_${STAMP}.tar.gz"
docker run --rm \
  -v "${WP_VOLUME}:/data:ro" \
  -v "${BACKUP_DIR}:/backup" \
  alpine sh -c "tar czf /backup/${FILES_NAME} -C /data . && chown $(id -u):$(id -g) /backup/${FILES_NAME}"
log "Files backup saved:    $BACKUP_DIR/$FILES_NAME ($(du -h "$BACKUP_DIR/$FILES_NAME" | cut -f1))"

# ---------- 4. retention ----------
DELETED=$(find "$BACKUP_DIR" -type f \( -name 'db_*.sql.gz' -o -name 'wp_files_*.tar.gz' \) \
  -mtime +"$RETENTION_DAYS" -print -delete | wc -l)
log "Retention: removed ${DELETED} backup file(s) older than ${RETENTION_DAYS} days."

log "===== Backup finished successfully ====="

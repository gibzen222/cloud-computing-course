# Screenshots (evidence)

Take these on your own VM and save them in this folder with exactly these names, so the links in the main README work. Use PNG.

| # | File name | What to capture | Command / action |
|---|---|---|---|
| 01 | `01-vm-settings.png` | VirtualBox VM details (2 CPU, 4096 MB, 25 GB disk, NAT) and the Port Forwarding rules window | VirtualBox Manager, Settings > Network > Advanced > Port Forwarding |
| 02 | `02-ssh-login.png` | Logging in from the laptop over SSH | `ssh -p 2222 <user>@127.0.0.1` |
| 03 | `03-docker-version.png` | Docker and Compose installed | `docker --version` and `docker compose version` |
| 04 | `04-compose-ps.png` | Both containers running, db healthy | `docker compose ps` |
| 05 | `05-wordpress-site.png` | The site open in the laptop browser | http://localhost:8080 |
| 06 | `06-persistence-after-reboot.png` | Test post still there after `sudo reboot`, plus `docker volume ls` | browser + terminal |
| 07 | `07-ufw-status.png` | Firewall active, default deny, only 22 and 80 | `sudo ufw status verbose` |
| 08 | `08-ss-ports.png` | Port 3306 not listening on the host | `sudo ss -tulpn` |
| 09 | `09-backup-run.png` | Manual script run and the backup files | `./automation-script.sh` and `ls -lh ~/backups` |
| 10 | `10-crontab.png` | The scheduled job | `crontab -l` |
| 11 | `11-restore.png` | Deleted post restored from backup | see Operational Manual §7.3 |

Tip: in Windows, **Win + Shift + S** takes a screenshot of part of the screen.

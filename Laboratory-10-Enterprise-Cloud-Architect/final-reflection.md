# Final Reflection: From Mission 1 to Mission 10

**CCM101 - Cloud Computing** · Laboratory 10: The Enterprise Cloud Architect
**Prepared by:** Bustria, Gibzen | Seminiano, Jake | Pascua, John Cyrom | Urbino, Jethrone | Velicaria, John Henrick · **Section:** BSIT 4H

---

## 1. Where we started (Mission 1)

Before Mission 1, most of us only knew computers through Windows. Linux was something we had heard of but never really used, and "the cloud" meant saving files in Google Drive. Mission 1 showed us that cloud computing is much bigger than that. We learned the service models (IaaS, PaaS and SaaS) and the deployment models (public, private, hybrid and community), and we classified apps we use every day, like Google Drive, Netflix and GCash.

The first time we opened a terminal, we were honestly nervous. There were no buttons or icons, only a blinking cursor, and we were afraid that one wrong command would break something. The first concept that confused us was Git: why we had to add, then commit, then push, instead of just uploading a file. Once we understood that every commit is a saved checkpoint we can go back to, Git started to make sense. That idea came back at the very end of the course, when our whole server became files in a GitHub repository.

## 2. Building the skills (Missions 2 to 9)

Comparing cloud platforms (Mission 3). Acting as Cloud Solutions Consultants, we researched AWS, Microsoft Azure and Google Cloud and recommended a platform for different CloudNova clients. At first we wanted to pick the "best" provider. We got unstuck when we realized there is no single best one: the right choice depends on the client's existing tools, budget, skills and growth. That changed how we approach every technical decision: start from the requirement, not from the popular option.

Linux commands and file permissions. We learned to move around the file system, edit files with nano, and read permissions with ls -l. We often got stuck on "Permission denied." It took us a while to see that this usually means one of two things: the file is not executable, or we are not allowed to touch it. chmod +x, sudo, and simply reading the error carefully became our first tools for fixing problems.

## 3. The final mission (Mission 10)

We chose WordPress and MySQL because it is a real multi-tier stack: a web tier and a data tier that must talk to each other securely. It is also widely used, so the official documentation helped us a lot.

Mission 10 tested our patience more than any other mission. We first attached a Windows Server ISO instead of Ubuntu, so the VM kept saying no operating system was found. After we rebuilt the VM, it failed again with VERR_FILE_NOT_FOUND because its virtual disk file was missing. The new VM was almost frozen until we noticed the Processing Cap was set to 1% instead of 100%. Then SSH from the laptop failed with kex_exchange_identification, and the cause was simple: we had not ticked "Install OpenSSH server" during installation.

Copying and pasting was another lesson. When we pasted commands from a PDF, the line breaks disappeared and several commands ran as one, and our docker-compose.yml lost its indentation. We solved it by running one command at a time and copying the files to the VM with scp instead of pasting. Our first deployment then showed "Error establishing a database connection" because the database volume had been created with old passwords. Since there was no real data yet, we reset it with docker compose down -v and deployed again. In each case the fix came from reading the error message and checking one thing at a time.

Every requirement now protects something real. Without persistent volumes, a reboot would erase the client's website. Without the firewall, anyone could reach services that should be private. Without the backup script, one mistake would be permanent. We proved this in our demo by deleting a post and restoring it from the nightly backup.

## 4. How the pieces connect

Our final system puts everything from the course in one place. VirtualBox gives us a server, Ubuntu Server runs it, and SSH lets us manage it remotely like a real data center. UFW decides what may enter. Docker Compose builds the two-tier application from one file. Volumes keep the data safe, and a Bash script run by cron backs it up every night.

For us, Infrastructure as Code now means that our server is not something we set up once and hope to remember. It is a set of files in GitHub that anyone on the team can clone and rebuild in minutes, which is exactly what we did when we redeployed our stack on the VM straight from GitHub.

## 5. Looking ahead

This course changed how we see cloud computing. It is not just storage on someone else's computer. It is the skill of building systems that are secure, repeatable and able to take care of themselves. We now understand why companies value DevOps: automation and documentation save time and prevent mistakes.

If we continued this project, we would add HTTPS with a reverse proxy, send backups off the server to cloud storage, add monitoring and alerts, and deploy the same stack on a real cloud provider such as AWS or Google Cloud. Next, we want to learn container orchestration with Kubernetes and CI/CD pipelines with GitHub Actions.

## 6. AI use

We used an AI assistant (Claude) during Mission 10 to explain concepts, troubleshoot errors, draft parts of the documentation, and help us write this reflection. We did the work ourselves: we built and configured the VM, ran and fixed every command, tested persistence, the firewall, the backups and the restore, and reviewed and edited the documents before submitting them.

# Reflection: Cloud Services & Version Control in Practice

## 1. Cloud Services & Model Classification

Cloud computing powers many tools I use every day. Three prominent examples include:

* **Google Drive:** Classified as **Software as a Service (SaaS)** and deployed on a **Public Cloud**. It provides a fully functional end-user application for file storage and document editing without requiring users to manage backend servers or operating systems. Google hosts and manages this multi-tenant infrastructure for public access over the internet.
* **Netflix:** Classified as **SaaS** running on a **Public Cloud**. Netflix delivers a ready-to-use video streaming application directly to end consumers. The underlying streaming architecture and media storage rely heavily on Amazon Web Services (AWS), making it a public cloud-hosted service serving millions globally.
* **GCash:** Classified as **SaaS** using a **Hybrid Cloud** model. It offers a complete mobile wallet application to end users. While client-facing features run on public cloud infrastructure to handle peak traffic smoothly, its financial core integrates with secure private networks and banking systems to comply with strict monetary regulations.

---

## 2. Importance of Git & GitHub in Cloud Projects

In modern cloud computing, infrastructure is frequently defined, provisioned, and managed using text files—a concept known as **Infrastructure as Code (IaC)**. Because configuration files control live servers and databases, managing them with version control is critical.

GitHub plays a central role in this process by enabling teams to:

* **Track Changes & Prevent Outages:** Every modification to infrastructure configuration is logged with details on who changed what and why. If a bad commit misconfigures a server, team members can quickly identify the bug and revert to a stable previous commit to minimize downtime.
* **Enable Safe Collaboration:** Engineers can work on distinct infrastructure features in isolated **branches**. Through **Pull Requests**, peers review proposed infrastructure code and run automated tests before merging changes into the main production branch.
* **Maintain Consistency:** Centralized repositories ensure the entire team deploys from a single, verified source of truth, avoiding configuration drift across cloud environments.

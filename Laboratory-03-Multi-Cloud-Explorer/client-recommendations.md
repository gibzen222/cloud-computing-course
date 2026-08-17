# Cloud Platform Client Recommendations

## Checkpoint 4 — Cloud Platform Recommendation Challenge

This document evaluates four CloudNova Technologies client scenarios and recommends a suitable cloud platform based on each client's business and technical requirements.

---

## Client A — Startup Company

### Recommended Platform: Amazon Web Services (AWS)

I recommend **Amazon Web Services (AWS)** because the startup requires an infrastructure that can begin relatively small and scale as its mobile application's user base increases. AWS provides on-demand infrastructure and several services that allow developers to build applications without purchasing physical servers. The startup can use scalable compute, storage, and managed databases as the application grows. AWS also provides architectures that allow resources to be automatically adjusted according to application demand.

### Recommended AWS Services

1. **Amazon EC2** – Virtual machines for application servers.
2. **Amazon S3** – Object storage for application files, images, and backups.
3. **Amazon RDS** – Managed relational database service.
4. **Amazon EC2 Auto Scaling** – Automatically adjusts compute capacity based on demand.

---

## Client B — University

### Recommended Platform: Microsoft Azure

I recommend **Microsoft Azure** because the university already uses Windows Server, Microsoft 365, and Active Directory technologies. Using Azure allows the university to build a cloud environment closely connected with its existing Microsoft ecosystem. Microsoft identity technologies can support centralized identity and access management while Azure Virtual Machines can host Windows or Linux systems. Azure's migration and hybrid-cloud services also make it appropriate for organizations gradually moving from on-premises infrastructure to the cloud.

### Recommended Azure Services

1. **Azure Virtual Machines** – Hosts Windows and Linux workloads.
2. **Microsoft Entra ID** – Provides cloud identity and access management.
3. **Azure Blob Storage** – Stores files, backups, and other objects.
4. **Azure Migrate** – Assists with assessing and migrating workloads to Azure.

---

## Client C — AI Research Company

### Recommended Platform: Google Cloud

I recommend **Google Cloud** because the company develops artificial intelligence and machine-learning applications and requires high-performance computing resources. Google Cloud provides Vertex AI for creating and operating machine-learning solutions as well as infrastructure designed for demanding computing workloads. Compute Engine can provide virtual machines with appropriate processing resources, while Cloud Storage can hold training datasets and model-related data. Google Kubernetes Engine could also support containerized AI applications.

### Recommended Google Cloud Services

1. **Vertex AI** – Machine-learning development and deployment platform.
2. **Compute Engine** – Virtual machines for compute-intensive workloads.
3. **Cloud Storage** – Storage for datasets and AI/ML files.
4. **Google Kubernetes Engine (GKE)** – Managed Kubernetes for containerized applications.

---

## Client D — Global E-Commerce Company

### Recommended Platform: Amazon Web Services (AWS)

I recommend **AWS** because the company requires highly available infrastructure, automatic scaling, and the ability to serve customers in multiple parts of the world. AWS Regions and Availability Zones can be used to design resilient applications, while Auto Scaling can increase or decrease application capacity according to demand. Amazon CloudFront can distribute web content closer to global users, and Amazon RDS can provide managed relational databases. These services make AWS a strong candidate for a large e-commerce system that experiences changing traffic levels.[6][7]

### Recommended AWS Services

1. **Amazon EC2** – Compute infrastructure for web and application servers.
2. **Amazon EC2 Auto Scaling** – Adjusts capacity according to demand.
3. **Amazon RDS** – Managed relational database.
4. **Amazon CloudFront** – Global content delivery network.
5. **Amazon S3** – Object storage for static files, product images, and backups.

---

# Checkpoint 6 — Multi-Cloud Decision Matrix

| Business Requirement | Recommended Platform | Justification |
|---|---|---|
| Startup Company | AWS | Offers scalable on-demand infrastructure and a broad collection of services that can support a company as it grows. |
| Enterprise Organization | AWS | Provides a broad cloud portfolio and infrastructure suitable for many enterprise workloads. |
| Microsoft Environment | Microsoft Azure | Provides strong integration with Microsoft identity, Windows, and enterprise technologies. |
| AI / Machine Learning | Google Cloud | Vertex AI and Google's data and machine-learning services provide a strong AI/ML environment. |
| Kubernetes Deployment | Google Cloud | Google Kubernetes Engine provides a mature managed Kubernetes environment. |
| Global Web Application | AWS | AWS Regions, Availability Zones, CloudFront, and Auto Scaling can support scalable global web architectures. |

---

# Conclusion

No cloud provider is automatically the best provider for every company. The correct choice depends on factors such as existing technologies, workload requirements, available technical expertise, security requirements, scalability, geographic needs, and budget.

The recommendations in this document therefore match each client's requirements to the cloud platform and services that best address the scenario.

---

# References

https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html "Amazon EC2 Auto Scaling"  
https://learn.microsoft.com/en-us/entra/fundamentals/whatis "What is Microsoft Entra ID?"  
https://learn.microsoft.com/en-us/azure/migrate/migrate-services-overview "Azure Migrate"  
https://cloud.google.com/vertex-ai/docs/start/introduction-unified-platform "Vertex AI"  
https://cloud.google.com/compute/docs/overview "Compute Engine"  
https://aws.amazon.com/about-aws/global-infrastructure/ "AWS Global Infrastructure"  
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html "Amazon CloudFront"  
https://aws.amazon.com/rds/ "Amazon RDS"  
https://aws.amazon.com/s3/ "Amazon S3"  
https://cloud.google.com/kubernetes-engine/docs/concepts/kubernetes-engine-overview "Google Kubernetes Engine"  
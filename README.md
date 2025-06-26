# .NET CI/CD Pipeline on Azure

This project sets up a CI/CD pipeline using Azure DevOps and Terraform for a .NET web app deployed to Azure App Services across dev, staging, and prod environments.

**Tech Stack**:  
- Azure DevOps Pipelines  
- Terraform for infrastructure  
- .NET 9.0 Web App  
- Azure App Services  
- Azure Monitor (optional)

**Pipeline Stages**:  
- Terraform : Provisioning Infrastructure
- Build and test  
- Deploy to Dev  
- Deploy to Staging  
- Deploy to Prod (manual approval)

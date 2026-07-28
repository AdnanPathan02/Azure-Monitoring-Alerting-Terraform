# Azure Monitoring & Alerting using Terraform

![Architecture](architecture/01-Final-Architecture.png)

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?style=for-the-badge&logo=microsoftazure)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-5391FE?style=for-the-badge&logo=powershell)
![GitHub](https://img.shields.io/badge/GitHub-Actions-2088FF?style=for-the-badge&logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

# Project Overview

This project demonstrates how to provision and monitor Azure infrastructure using **Terraform** and **Azure Monitor**.

A Windows Server Virtual Machine is deployed completely through Infrastructure as Code (IaC), connected to Azure Monitor through the Azure Monitor Agent, and configured with Log Analytics Workspace, Data Collection Rules, Metric Alerts, Log Alerts, and Action Groups.

The solution automatically detects infrastructure health issues such as:

- High CPU Utilization
- Low Available Memory

Whenever a threshold is exceeded, Azure Monitor evaluates the alert rule and automatically sends an email notification to the administrator through an Action Group.

This project demonstrates real-world Azure monitoring and operational practices commonly used by Azure Administrators and Cloud Engineers.

---

# Architecture

## Overall Architecture

![Architecture](architecture/01-Final-Architecture.png)

---

## Monitoring Data Flow

![Monitoring](architecture/02-Monitoring-Data-Flow.png)

---

## Alert Notification Flow

![Alert Flow](architecture/03-Alert-Notification-Flow.png)

---

# Key Features

- Infrastructure deployed using Terraform
- Windows Server Virtual Machine
- Azure Virtual Network
- Network Security Group
- Public IP
- Azure Monitor Agent
- Log Analytics Workspace
- Data Collection Rule (DCR)
- Azure Monitor Metric Alerts
- Azure Monitor Log Alerts
- Azure Action Groups
- Email Notifications
- KQL Queries
- VM Insights
- PowerShell CPU Stress Test
- Infrastructure Validation
- GitHub Ready Project Structure

---

# Azure Services Used

| Service | Purpose |
|----------|----------|
| Azure Virtual Machine | Compute Resource |
| Azure Virtual Network | Networking |
| Network Security Group | Network Security |
| Public IP | Remote Access |
| Azure Monitor Agent | Monitoring Agent |
| Log Analytics Workspace | Log Collection |
| Data Collection Rule | Data Collection Configuration |
| Azure Monitor | Metrics and Monitoring |
| Metric Alert | CPU Monitoring |
| Log Alert | Memory Monitoring |
| Action Group | Alert Notification |
| Azure Portal | Monitoring & Validation |
| Terraform | Infrastructure as Code |

---

# Project Folder Structure

```text
Azure-Monitoring-Alerting-Terraform
│
├── .github/
│   └── workflows/
│
├── architecture/
│   ├── 01-Final-Architecture.png
│   ├── 02-Monitoring-Data-Flow.png
│   └── 03-Alert-Notification-Flow.png
│
├── bootstrap/
│
├── queries/
│   ├── Heartbeat.kql
│   ├── CPU-Performance.kql
│   ├── Memory-Performance.kql
│
├── screenshots/
│   ├── 01-Terraform/
│   ├── 02-Azure-Resources/
│   ├── 03-Monitoring/
│   ├── 04-Alerts/
│   ├── 05-Validation/
│   └── 06-CICD/
│
├── scripts/
│   └── CPU-Stress-Test.ps1
│
├── terraform/
│
├── README.md
│
└── .gitignore
```

---

# Project Workflow

```text
Terraform
      │
      ▼
Azure Resource Group
      │
      ▼
Windows Server VM
      │
      ▼
Azure Monitor Agent
      │
      ▼
Data Collection Rule
      │
      ▼
Log Analytics Workspace
      │
      ▼
Metric Alert / Log Alert
      │
      ▼
Action Group
      │
      ▼
Email Notification
```

---

# Skills Demonstrated

- Microsoft Azure Administration
- Azure Monitoring
- Azure Monitor Agent
- Azure Log Analytics
- Azure Alerting
- Azure Action Groups
- Infrastructure as Code (Terraform)
- Windows Server Administration
- Network Security Groups
- Virtual Networking
- PowerShell Automation
- KQL (Kusto Query Language)
- Infrastructure Monitoring
- Cloud Operations
---

# Prerequisites

Before deploying the infrastructure, ensure the following tools and resources are available:

## Azure Requirements

- Active Azure Subscription
- Contributor or Owner access to the subscription

## Local Tools

- Terraform v1.6 or later
- Azure CLI
- PowerShell 7.x (or Windows PowerShell 5.1+)
- Git
- Visual Studio Code
- Azure Account with appropriate permissions

---

# Deployment Steps

## Step 1 — Clone Repository

```bash
git clone https://github.com/AdnanPathan02/Azure-Monitoring-Alerting-Terraform.git

cd Azure-Monitoring-Alerting-Terraform
cd terraform
```

---

## Step 2 — Configure Terraform Variables

Copy the example variables file.

```bash
cp terraform.tfvars.example terraform.tfvars
```

Update the following values:

- Subscription ID
- Administrator Email
- Allowed RDP Source
- Resource Group Name
- VM Size

---

## Step 3 — Login to Azure

```bash
az login
```

Verify the active subscription.

```bash
az account show
```

---

## Step 4 — Initialize Terraform

```bash
terraform init
```

Terraform downloads the required Azure provider plugins.

---

## Step 5 — Validate Configuration

```bash
terraform validate
```

Terraform checks configuration syntax and resource definitions.

---

## Step 6 — Review Execution Plan

```bash
terraform plan
```

Review all resources that will be created before deployment.

---

## Step 7 — Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform provisions all Azure resources.

---

# Infrastructure Created

Terraform deploys the following Azure resources automatically.

| Resource | Purpose |
|----------|----------|
| Resource Group | Logical container |
| Virtual Network | Networking |
| Subnet | VM subnet |
| Network Security Group | Secure inbound traffic |
| Public IP | Remote access |
| Network Interface | VM connectivity |
| Windows Server VM | Compute |
| Azure Monitor Agent | Monitoring |
| Data Collection Rule | Performance data collection |
| Log Analytics Workspace | Log storage |
| Metric Alert | High CPU monitoring |
| Log Alert | Low Memory monitoring |
| Action Group | Email notification |

---

# Terraform Configuration Files

| File | Description |
|------|-------------|
| versions.tf | Terraform version constraints |
| provider.tf | Azure provider configuration |
| backend.tf | Remote backend configuration |
| variables.tf | Variable definitions |
| terraform.tfvars.example | Sample variable values |
| network.tf | Networking resources |
| virtual-machine.tf | Windows VM deployment |
| monitoring.tf | Azure Monitor configuration |
| alerts.tf | Metric and Log Alerts |
| outputs.tf | Deployment outputs |

---

# Deployment Outputs

After successful deployment, Terraform returns outputs similar to:

- Resource Group Name
- Virtual Machine Name
- Public IP Address
- Log Analytics Workspace Name
- Action Group Name

---

# Azure Resource Validation

Verify that the following resources are successfully created:

- Resource Group
- Windows Server Virtual Machine
- Network Security Group
- Public IP
- Azure Monitor Agent
- Data Collection Rule
- Log Analytics Workspace
- Metric Alert
- Log Alert
- Action Group

---

# Screenshots

## Terraform

### Project Structure

![Project Structure](screenshots/01-Terraform/01-Project-Structure.png)

---

### Terraform Initialization

![Terraform Init](screenshots/01-Terraform/02-Terraform-Init.png)

---

### Terraform Validation

![Terraform Validate](screenshots/01-Terraform/03-Terraform-Validate.png)

---

### Terraform Plan

![Terraform Plan](screenshots/01-Terraform/04-Terraform-Plan.png)

---

### Terraform Apply

![Terraform Apply](screenshots/01-Terraform/05-Terraform-Apply.png)

---

### Terraform State

![Terraform Outputs](screenshots/01-Terraform/06-Terraform-State.png)

---

### Terraform Outputs

![Terraform State](screenshots/01-Terraform/07-Terraform-Outputs.png)

---
### Terraform Configuration Files

![Terraform Files](screenshots/01-Terraform/08-Terraform-Files.png)

---

### Terraform Variables

![Terraform Variables](screenshots/01-Terraform/09-TFVars.png)

---

# Azure Resources

## Resource Group

![Resource Group](screenshots/02-Azure-Resources/01-Resource-Group.png)

---

## Virtual Machine

![Virtual Machine](screenshots/02-Azure-Resources/02-Virtual-Machine.png)

---

## Networking

![Networking](screenshots/02-Azure-Resources/03-Networking.png)

---

## Log Analytics Workspace

![Log Analytics](screenshots/02-Azure-Resources/04-Log-Analytics-Overview.png)

---

## Data Collection Rule

![DCR](screenshots/02-Azure-Resources/05-DCR.png)

---

## Azure Monitor Agent

![AMA](screenshots/02-Azure-Resources/06-Azure-Monitor-Agent.png)

---

## Action Group


![Action Group](screenshots/02-Azure-Resources/07-Action-Group.png)
---

---

# Azure Monitoring

Azure Monitor continuously collects metrics and logs from the Windows Server Virtual Machine through the Azure Monitor Agent.

The collected telemetry is forwarded to the Log Analytics Workspace using a Data Collection Rule (DCR), where it can be queried using Kusto Query Language (KQL).

Monitoring includes:

- Heartbeat Monitoring
- CPU Performance
- Memory Performance
- Disk Performance
- Network Performance
- VM Insights

---

# Monitoring Workflow

```text
Windows Server VM
        │
        ▼
Azure Monitor Agent
        │
        ▼
Data Collection Rule
        │
        ▼
Log Analytics Workspace
        │
        ▼
KQL Queries / VM Insights
```

---

# Monitoring Screenshots

## Log Analytics Workspace

![Workspace](screenshots/03-Monitoring/01-Workspace-Overview.png)

---

## Heartbeat Query

Heartbeat confirms that the Azure Monitor Agent is actively communicating with Azure Monitor.

```kusto
Heartbeat
| summarize LastHeartbeat=max(TimeGenerated) by Computer
```

![Heartbeat](screenshots/03-Monitoring/02-Heartbeat-Query.png)

---

## Performance Counters

```kusto
Perf
| summarize count() by ObjectName
```

![Perf](screenshots/03-Monitoring/03-Perf-Table.png)

---

## CPU Monitoring

```kusto
Perf
| where ObjectName == "Processor"
| where CounterName == "% Processor Time"
| project TimeGenerated, Computer, CounterValue
| order by TimeGenerated desc
```

![CPU Query](screenshots/03-Monitoring/04-CPU-Query.png)

---

## CPU Graph

![CPU Graph](screenshots/03-Monitoring/05-CPU-Graph.png)

---

## Memory Monitoring

```kusto
Perf
| where ObjectName == "Memory"
| where CounterName == "Available MBytes"
| project TimeGenerated, Computer, CounterValue
| order by TimeGenerated desc
```

![Memory Query](screenshots/03-Monitoring/06-Memory-Query.png)

---

## Disk Monitoring

```kusto
Perf
| where ObjectName == "LogicalDisk"
| where CounterName == "% Free Space"
| project TimeGenerated, Computer, InstanceName, CounterValue
| order by TimeGenerated desc
```

![Disk Query](screenshots/03-Monitoring/07-Disk-Query.png)

---

## Network Monitoring

```kusto
Perf
| where ObjectName == "Network Interface"
| where CounterName == "Bytes Total/sec"
| project TimeGenerated, Computer, CounterValue
| order by TimeGenerated desc
```

![Network Query](screenshots/03-Monitoring/08-Network-Query.png)

---

## VM Insights

Azure VM Insights provides graphical monitoring for:

- CPU
- Memory
- Network
- Disk
- Availability

![VM Insights](screenshots/03-Monitoring/09-VM-Insights.png)

---

# Alert Configuration

Two Azure Monitor alerts are configured.

| Alert | Purpose |
|--------|----------|
| High CPU Metric Alert | Detect CPU utilization above configured threshold |
| Low Memory Log Alert | Detect low available memory |

---

# Alert Workflow

```text
CPU Usage > Threshold
or
Available Memory < Threshold
        │
        ▼
Azure Monitor
        │
        ▼
Metric Alert / Log Alert Rule
        │
        ▼
Action Group
        │
        ▼
Email Notification
        │
        ▼
Administrator
```

---

# Alert Screenshots

## Alert Rules

![Alert Rules](screenshots/04-Alerts/01-Alert-Rules.png)

---

## Action Group

![Action Group](screenshots/04-Alerts/02-Action-Group.png)

---

## CPU Stress Test

A PowerShell script was executed on the VM to generate sustained CPU load and validate the High CPU Alert.

![CPU Stress](screenshots/04-Alerts/03-CPU-Stress-Test.png)

---

## High CPU Alert

![CPU Alert](screenshots/04-Alerts/04-CPU-Alert-Fired.png)

---

## Low Memory Alert

![Memory Alert](screenshots/04-Alerts/05-Low-Memory-Alert-Fired.png)

---

## Alert History

![Alert History](screenshots/04-Alerts/06-Alert-History.png)

---

## Email Notification

Azure Monitor successfully delivered an email notification through the configured Action Group.

![Email](screenshots/04-Alerts/07-Email-Notification.png)

---

# Validation

The following validation activities were successfully completed.

- VM deployed successfully
- Azure Monitor Agent connected
- Heartbeat received
- Performance counters collected
- Log Analytics queries executed
- VM Insights enabled
- CPU Alert triggered
- Low Memory Alert triggered
- Email notification received

---

# Validation Screenshots

## VM Running

![VM Running](screenshots/05-Validation/01-VM-Running.png)

---

## Heartbeat Validation

![Heartbeat](screenshots/05-Validation/02-Heartbeat-Validation.png)

---

## Performance Validation

![Performance](screenshots/05-Validation/03-Perf-Validation.png)

---

## CPU Validation

![CPU Validation](screenshots/05-Validation/04-CPU-Validation.png)

---

## Alert Validation

![Alert Validation](screenshots/05-Validation/05-Alert-Validation.png)

---

## Email Validation

![Email Validation](screenshots/05-Validation/06-Email-Validation.png)

---

# GitHub Actions (CI/CD)

This project includes GitHub Actions workflows to automate Terraform validation, planning, deployment, and infrastructure cleanup.

## Workflow Files

```text
.github/
└── workflows/
    ├── terraform-ci.yml
    ├── terraform-deploy.yml
    └── terraform-destroy.yml
```

---

## CI Workflow

The Continuous Integration workflow automatically performs:

- Terraform Format Check
- Terraform Initialization
- Terraform Validation
- Terraform Plan

This ensures every code change is validated before deployment.

---

## Deployment Workflow

The deployment workflow performs:

- Azure Login
- Terraform Init
- Terraform Plan
- Terraform Apply

Deployment can be triggered manually using GitHub Actions.

---

## Destroy Workflow

The destroy workflow safely removes Azure resources when they are no longer required.

Steps performed:

- Azure Login
- Terraform Init
- Terraform Plan -destroy
- Terraform Destroy

---

# CI/CD Screenshots

## GitHub Repository

![Repository](screenshots/06-CICD/01-GitHub-Repository.png)

---

## GitHub Secrets

![Secrets](screenshots/06-CICD/02-GitHub-Secrets.png)

---

## Workflow Files

![Workflow Files](screenshots/06-CICD/03-Workflow-Files.png)

---

## Terraform CI Workflow

![Terraform CI](screenshots/06-CICD/04-Terraform-CI-Success.png)

---

## Terraform Deployment Workflow

![Terraform Deploy](screenshots/06-CICD/05-Terraform-Deploy-Success.png)

---

## Workflow Summary

![Workflow Summary](screenshots/06-CICD/06-Workflow-Summary.png)

---

# Security Best Practices

The following security practices have been implemented throughout the project:

- Infrastructure deployed using Terraform
- Sensitive values stored in `terraform.tfvars`
- `terraform.tfvars` excluded using `.gitignore`
- Sample configuration provided using `terraform.tfvars.example`
- Azure Monitor Agent used for secure telemetry collection
- Monitoring data collected through Data Collection Rules
- Alerts configured using Azure Monitor
- Email notifications delivered through Action Groups
- Remote Terraform State supported
- Repository structured for secure collaboration

---

# Cost Optimization

To avoid unnecessary Azure charges:

- Delete the project Resource Group after validation.
- Keep only the Terraform State Storage Account if future deployments are required.
- Use `terraform destroy` when infrastructure is no longer needed.

---

# Cleanup

Destroy all deployed resources using Terraform.

```bash
terraform destroy
```

Or delete the Resource Group directly from the Azure Portal after collecting all required screenshots.

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Microsoft Azure Administration
- Infrastructure as Code (Terraform)
- Azure Virtual Machines
- Azure Networking
- Network Security Groups
- Azure Monitor
- Azure Monitor Agent
- Log Analytics Workspace
- Data Collection Rules
- Azure Monitor Metric Alerts
- Azure Monitor Log Alerts
- Azure Action Groups
- Kusto Query Language (KQL)
- Windows Server Administration
- PowerShell Automation
- Infrastructure Validation
- GitHub
- GitHub Actions
- CI/CD

---

# Future Improvements

Potential enhancements for this project include:

- Azure Key Vault integration
- Managed Identity authentication
- Diagnostic Settings for additional Azure resources
- Azure Storage monitoring
- VM Scale Sets monitoring
- Azure Backup integration
- Microsoft Sentinel integration
- Azure Policy compliance monitoring
- Dashboard automation
- Teams and Microsoft Teams notifications

---

# Learning Outcomes

This project helped strengthen practical knowledge in:

- Azure Monitoring
- Azure Alerting
- Infrastructure Automation
- Infrastructure Validation
- Azure Operations
- Cloud Administration
- Terraform
- Azure Resource Management
- Azure Security
- Monitoring Best Practices

---

# Author

**Adnan Pathan**

Azure Cloud Administrator | Terraform | Microsoft Azure | PowerShell | Infrastructure as Code

GitHub:

https://github.com/AdnanPathan02

---

# License

This project is licensed under the MIT License.

---

# Acknowledgements

Microsoft Azure Documentation

Terraform Documentation

Azure Monitor Documentation

GitHub Actions Documentation

---

# Support

If you found this project useful, consider giving it a ⭐ on GitHub.

It helps others discover the project and supports continued development.

---

## Thank You

Thank you for visiting this repository.

Feedback, suggestions, and contributions are always welcome.
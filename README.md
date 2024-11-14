# MTT CoHack Challenge: Managing an on-prem datacenter from the cloud using Azure Arc

## Introduction

In this challenge-based hackathon, we will work together to explore Azure Arc to manage your resources across on-premises, multi-cloud, and edge environments. 

Your challenge is to deploy Azure Arc and onboard servers in an on-premises datacenter to Azure Arc. You will also explore the capabilities of Azure Arc and learn how to manage your resources at scale.

## Requirements

- Your coaches will give you login details to an Azure VM **HVHOST**, running a Hyper V environment with a simulated on-premises datacenter
  - **DC1**: Domain Controller running Windows Server 2022 without GUI
  - **SRV1**: Windows Server 2022 with SQL Server 2022
  - **LIN1**: Ubuntu Linux 24.04
- Your coaches will also give you login details to an Azure subscription with a resource group called **rg-cohackArc**. Please create all resources in this resource group.
- The resource group rg-cohackArc contains a log analytics workspace called log-analytics-\<xxxxx>. Please use this workspace for any tasks that require monitoring.
- Do **not** onboard the HVHOST machine to Azure Arc

![image](./images/hvhost.png)

![image](./images/azure.png)

## Learning Objectives

This hack will help you learn how to:

- Onboard on-prem servers to Azure Arc using different methods
- Enable monitoring and insights for on-prem servers using Azure Arc
- Manage and govern your on-prem resources at scale using Azure Policies
- Add extensions to Arc-enabled machines
- Use Defender for Cloud to get recommendations for your on-prem servers
- Change SQL configuration settings on an Arc-enabled SQL Server
- Manage updates from the cloud

## Success Criteria

### Challenge 1: Onboard on-prem servers to Azure Arc

- Connect to HVHOST and power on your data center servers
- Onboard SRV1 to Azure Arc from the Windows GUI using the built-in Azure Arc client, ensure Arc covers both Windows and SQL Server
- Onboard DC1 to Azure Arc from the Windows GUI using an interactive script. *Hint: if copying to the console gives you trouble, use Notepad on DC1 and save the file locally*
- Onboard the LIN1 server to Azure Arc using a non-interactive script.

#### Resources

- [Azure Arc Overview](https://learn.microsoft.com/en-us/azure/azure-arc/overview)
- [Onboarding servers](https://learn.microsoft.com/en-us/azure/azure-arc/servers/overview)
- [Connect Windows Server machines to Azure through Azure Arc Setup](https://learn.microsoft.com/en-us/azure/azure-arc/servers/onboard-windows-server)
- Supported regions for [Arc-enabled SQL Servers](https://learn.microsoft.com/en-us/sql/sql-server/azure-arc/prerequisites?view=sql-server-ver16&tabs=azure#supported-regions)
- Deploy a sandbox showcasing all Arc features and explore Azure Stack HCI [ArcBox/HCIBox](https://learn.microsoft.com)
- Arc SQL Dashboard on [Github](sql-server-samples/samples/features/azure-arc/dashboard/README.md)

### Challenge 2: Manage and govern your on-prem resources at scale

- Enable Insights for all Arc-enabled servers using the available Log Analytics workspace, including process data and network connections
- Check SRV1 has the Arc extension for SQL Server installed. If not, add it with "LicenseOnly".
- Create an Azure Policy that configures periodidic checking for missing system updates on Arc-enabled servers in the resource group, including already existing resources
- Use Azure Update Manager to manage updates on all Arc-enabled servers
  - check for missing updates
  - schedule updates

#### Resources

- [Azure Policy for Arc-enabled servers](https://learn.microsoft.com/en-us/azure/azure-arc/servers/policy-reference)
- [Connect your SQL Server to Azure Arc on a server already enabled by Azure Arc](https://learn.microsoft.com/en-us/sql/sql-server/azure-arc/connect-already-enabled?view=sql-server-ver16&tabs=azure)
- [Azure Update Manager](https://learn.microsoft.com/en-us/azure/update-manager/overview)



### Challenge 3: Use Defender for Cloud to get recommendations for your on-prem servers

- Enable Defender for Cloud on all Arc-enabled servers if not onboarded yet
- review recommendations for your servers

#### Resources

- [Connect non-Azure machines to Defender for Cloud](https://learn.microsoft.com/en-us/azure/defender-for-cloud/quickstart-onboard-machines)

### Challenge 4: manage your SQL Server using Azure Arc from the Azure portal

- change SRV1 licensing to pay-as-you-go
- enable Entra ID login to SRV1 SQL Server
- run a SQL best practices assessment

#### Resources

- [SQL Server enabled by Azure Arc](https://learn.microsoft.com/en-us/sql/sql-server/azure-arc/overview?view=sql-server-ver16)

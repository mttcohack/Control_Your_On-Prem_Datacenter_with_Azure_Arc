#! /bin/bash

# Add the service principal application ID and secret here
ServicePrincipalId="<SERVICE PRINCIPAL ID>";
ServicePrincipalClientSecret="<SERVICE PRINCIPAL SECRET>";

# add subscription ID, resource group, tenant ID and region here
export subscriptionId="<SUBSCRIPTION ID>";
export resourceGroup="<RESOURCE GROUP NAME>";
export tenantId="<TENANT ID>";
export location="<REGION>";
export authType="principal";
export correlationId="3abc54a3-c129-4f28-b3e1-03d7aa959682";
export cloud="AzureCloud";


# Download the installation package
output=$(wget https://aka.ms/azcmagent -O /tmp/install_linux_azcmagent.sh 2>&1);
if [ $? != 0 ]; then wget -qO- --method=PUT --body-data="{\"subscriptionId\":\"$subscriptionId\",\"resourceGroup\":\"$resourceGroup\",\"tenantId\":\"$tenantId\",\"location\":\"$location\",\"correlationId\":\"$correlationId\",\"authType\":\"$authType\",\"operation\":\"onboarding\",\"messageType\":\"DownloadScriptFailed\",\"message\":\"$output\"}" "https://gbl.his.arc.azure.com/log" &> /dev/null || true; fi;
echo "$output";

# Install the hybrid agent
bash /tmp/install_linux_azcmagent.sh;

# Run connect command
sudo azcmagent connect --service-principal-id "$ServicePrincipalId" --service-principal-secret "$ServicePrincipalClientSecret" --resource-group "$resourceGroup" --tenant-id "$tenantId" --location "$location" --subscription-id "$subscriptionId" --cloud "$cloud" --correlation-id "$correlationId";

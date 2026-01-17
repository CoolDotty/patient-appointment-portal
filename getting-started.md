# Getting Started

## One-Time Setup

### Terraform State Storage

Before running the GitHub Actions workflow, you need to create an Azure Storage account for Terraform remote state. This ensures state is persisted between workflow runs.

```bash
# Create resource group for state
az group create --name tfstate-rg --location westus3

# Create storage account (name must be globally unique)
az storage account create \
  --name tfstatedemodeployment \
  --resource-group tfstate-rg \
  --sku Standard_LRS \
  --encryption-services blob

# Create blob container
az storage container create \
  --name tfstate \
  --account-name tfstatedemodeployment
```

### Cleanup (If Resources Already Exist)

If Terraform resources were previously created without state tracking, delete them before running the workflow:

```bash
az group delete --name demo-deployment --yes --no-wait
```

Wait for deletion to complete before triggering the workflow.



Get AZURE_CREDENTIALS
```
az ad sp create-for-rbac --name "GitHubActionsDeployment" --role contributor --scopes /subscriptions/$(az account show --query user.name -o tsv) --sdk-auth
```
Github Environment
  ┌──────────────────────────┬───────────────────────┐
  │         Variable         │     Example Value     |
  ├──────────────────────────┼───────────────────────┤
  │ RESOURCE_GROUP_NAME      │ main-deployment       |                                                                                      
  ├──────────────────────────┼───────────────────────┤ 
  │ AZURE_LOCATION           │ westus2               |
  ├──────────────────────────┼───────────────────────┤   
  │ TF_STATE_RESOURCE_GROUP  │ tfstate-rg            |                                                                                    
  ├──────────────────────────┼───────────────────────┤
  │ TF_STATE_STORAGE_ACCOUNT │ tfstatedemodeployment |                                                                                   
  ├──────────────────────────┼───────────────────────┤
  │ TF_STATE_CONTAINER       │ tfstate               |                                                                                      
  └──────────────────────────┴───────────────────────┘ 
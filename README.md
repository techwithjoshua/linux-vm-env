# azure-terraform

## Setup

1. Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

2. Login to Azure using Azure CLI
```
az login
```

3. Set Azure Subscription to use with "subscription_id" variable in local "terraform.tfvars" file
```
subscription_id = "<subscription-id>"
```

4. Initialize Terraform Configuration
```
terraform init
```

5. Apply Terraform Configuration
```
terraform apply
```

6. Destroy Terraform Configuration
```
terraform destroy
```

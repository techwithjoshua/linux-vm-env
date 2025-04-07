# Azure Linux Virtual Machine Environment

## Setup

1. Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

2. Login to Azure using [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-interactively)
```
az login
```

3. Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)

4. Clone Repository
```
git clone https://github.com/techwithjoshua/linux-vm-env.git
```

5. Set required variables in terraform.tfvars
    - Setup terraform.tfvars file
    ```
    mv example.terraform.tfvars terraform.tfvars
    ```
    - Set your Azure Subscription to use with "subscription_id" variable
    ```
    subscription_id = "<azure-subscription-id>"
    ```
    - Set admin username for vm login with "vm_admin_username" variable
    ```
    vm_admin_username = "<admin-username>"
    ```
    - Optionally override default values for other variables by removing "#" and setting custom value in terraform.tfvars file

6. Create SSH keys for logging into VM
```
ssh-keygen -t ed25519 -f ~/.ssh/linux_vm_env_key
```

7. Initialize Terraform Configuration
```
terraform init
```

8. Apply Terraform Configuration
```
terraform apply
```

9. Login to VM using SSH key
```
ssh -i ~/.ssh/linux_vm_env_key <admin-username>@<vm-public-ip>
```

10. Destroy Terraform resources when finished
```
terraform destroy
```

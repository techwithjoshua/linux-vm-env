# specifies required providers and their versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.22.0"
    }
  }
}

# configures provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# creates resource group
resource "azurerm_resource_group" "terraform_linux_vm_env" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# creates virtual machine and required resources using linux_vm_env module
module "linux_vm_env" {
  source = "./modules/linux_vm_env"

  vnet_name                = var.vnet_name
  vnet_location            = azurerm_resource_group.terraform_linux_vm_env.location
  vnet_resource_group_name = azurerm_resource_group.terraform_linux_vm_env.name
  vnet_address_space       = var.vnet_address_space

  subnet_name                 = var.subnet_name
  subnet_resource_group_name  = azurerm_resource_group.terraform_linux_vm_env.name
  subnet_virtual_network_name = var.vnet_name
  subnet_address_prefixes     = var.subnet_address_prefixes

  public_ip_name                = var.public_ip_name
  public_ip_resource_group_name = azurerm_resource_group.terraform_linux_vm_env.name
  public_ip_location            = azurerm_resource_group.terraform_linux_vm_env.location
  public_ip_allocation_method   = var.public_ip_allocation_method
  public_ip_sku                 = var.public_ip_sku
}

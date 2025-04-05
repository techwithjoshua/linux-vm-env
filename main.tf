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

  nic_name                         = var.nic_name
  nic_location                     = azurerm_resource_group.terraform_linux_vm_env.location
  nic_resource_group_name          = azurerm_resource_group.terraform_linux_vm_env.name
  nic_ip_config_name               = var.nic_ip_config_name
  nic_ip_config_private_allocation = var.nic_ip_config_private_allocation

  nsg_name                = var.nsg_name
  nsg_location            = azurerm_resource_group.terraform_linux_vm_env.location
  nsg_resource_group_name = azurerm_resource_group.terraform_linux_vm_env.name

  vm_name                         = var.vm_name
  vm_resource_group_name          = azurerm_resource_group.terraform_linux_vm_env.name
  vm_location                     = azurerm_resource_group.terraform_linux_vm_env.location
  vm_size                         = var.vm_size
  vm_admin_username               = var.vm_admin_username
  vm_os_disk_name                 = var.vm_os_disk_name
  vm_os_disk_caching              = var.vm_os_disk_caching
  vm_os_disk_storage_account_type = var.vm_os_disk_storage_account_type
  vm_image_publisher              = var.vm_image_publisher
  vm_image_offer                  = var.vm_image_offer
  vm_image_sku                    = var.vm_image_sku
  vm_image_version                = var.vm_image_version
}

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

# creates linux virtual machine and required resources using linux_vm_env module
module "linux_vm_env" {
  source = "./modules/linux_vm_env"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  subnet_name                 = var.subnet_name
  subnet_virtual_network_name = var.vnet_name
  subnet_address_prefixes     = var.subnet_address_prefixes

  public_ip_name              = var.public_ip_name
  public_ip_allocation_method = var.public_ip_allocation_method
  public_ip_sku               = var.public_ip_sku

  nic_name                         = var.nic_name
  nic_ip_config_name               = var.nic_ip_config_name
  nic_ip_config_private_allocation = var.nic_ip_config_private_allocation

  nsg_name = var.nsg_name

  vm_name                         = var.vm_name
  vm_size                         = var.vm_size
  vm_computer_name                = var.vm_computer_name
  vm_admin_username               = var.vm_admin_username
  vm_os_disk_name                 = var.vm_os_disk_name
  vm_os_disk_caching              = var.vm_os_disk_caching
  vm_os_disk_storage_account_type = var.vm_os_disk_storage_account_type
  vm_image_publisher              = var.vm_image_publisher
  vm_image_offer                  = var.vm_image_offer
  vm_image_sku                    = var.vm_image_sku
  vm_image_version                = var.vm_image_version
}

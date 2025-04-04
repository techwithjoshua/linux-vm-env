resource "azurerm_virtual_network" "linux_vm_env_vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "linux_vm_env_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_resource_group_name
  virtual_network_name = var.subnet_virtual_network_name
  address_prefixes     = var.subnet_address_prefixes

  depends_on = [
    azurerm_virtual_network.linux_vm_env_vnet
  ]
}

resource "azurerm_public_ip" "linux_vm_env_public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.public_ip_resource_group_name
  location            = var.public_ip_location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

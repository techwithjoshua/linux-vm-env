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

resource "azurerm_network_interface" "linux_vm_env_network_interface" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_resource_group_name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = azurerm_subnet.linux_vm_env_subnet.id
    private_ip_address_allocation = var.nic_ip_config_private_allocation
    public_ip_address_id          = azurerm_public_ip.linux_vm_env_public_ip.id
  }

  depends_on = [
    azurerm_subnet.linux_vm_env_subnet,
    azurerm_public_ip.linux_vm_env_public_ip
  ]
}

resource "azurerm_network_security_group" "linux_vm_env_network_security_group" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_resource_group_name
}

resource "azurerm_network_interface_security_group_association" "linux_vm_env_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.linux_vm_env_network_interface.id
  network_security_group_id = azurerm_network_security_group.linux_vm_env_network_security_group.id
}

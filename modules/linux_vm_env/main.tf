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

resource "azurerm_linux_virtual_machine" "linux_vm_env_virtual_machine" {
  name                = var.vm_name
  resource_group_name = var.vm_resource_group_name
  location            = var.vm_location
  size                = var.vm_size
  computer_name       = var.vm_computer_name
  admin_username      = var.vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.linux_vm_env_network_interface.id,
  ]

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file("~/.ssh/linux_vm_env_key.pub")
  }

  os_disk {
    name                 = var.vm_os_disk_name
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  depends_on = [
    azurerm_network_interface.linux_vm_env_network_interface,
  ]
}

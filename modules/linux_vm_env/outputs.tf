output "vnet_id" {
  value = azurerm_virtual_network.linux_vm_env_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.linux_vm_env_subnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.linux_vm_env_public_ip.id
}

output "network_interface_id" {
  value = azurerm_network_interface.linux_vm_env_network_interface.id
}

output "network_interface_mac" {
  value = azurerm_network_interface.linux_vm_env_network_interface.mac_address
}

output "network_security_group_id" {
  value = azurerm_network_security_group.linux_vm_env_network_security_group.id
}

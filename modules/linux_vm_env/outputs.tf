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

output "nic_nsg_association_id" {
  value = azurerm_network_interface_security_group_association.linux_vm_env_nic_nsg_association.id
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.linux_vm_env_virtual_machine.id
}

output "virtual_machine_os_disk_id" {
  value = azurerm_linux_virtual_machine.linux_vm_env_virtual_machine.os_disk[0].id
}

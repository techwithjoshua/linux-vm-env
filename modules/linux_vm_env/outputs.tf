output "vnet_id" {
  value = azurerm_virtual_network.linux_vm_env_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.linux_vm_env_subnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.linux_vm_env_public_ip.id
}

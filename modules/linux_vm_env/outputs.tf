output "vnet_id" {
  value = azurerm_virtual_network.linux_vm_env_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.linux_vm_env_subnet.id
}

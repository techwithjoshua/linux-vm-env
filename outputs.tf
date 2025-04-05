output "resource_group_id" {
  value = azurerm_resource_group.terraform_linux_vm_env.id
}

output "vnet_id" {
  value = module.linux_vm_env.vnet_id
}

output "subnet_id" {
  value = module.linux_vm_env.subnet_id
}

output "public_ip_id" {
  value = module.linux_vm_env.public_ip_id
}

output "network_interface_id" {
  value = module.linux_vm_env.network_interface_id
}

output "network_interface_mac" {
  value = module.linux_vm_env.network_interface_mac
}

output "network_security_group_id" {
  value = module.linux_vm_env.network_security_group_id
}

output "resource_group_id" {
  value = azurerm_resource_group.terraform_linux_vm_env.id
}

output "vnet_id" {
  value = module.linux_vm_env.vnet_id
}

output "subnet_id" {
  value = module.linux_vm_env.subnet_id
}

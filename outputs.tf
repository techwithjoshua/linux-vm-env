output "resource_group_id" {
  value = module.linux_vm_env.resource_group_id
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

output "nsg_ssh_rule_id" {
  value = module.linux_vm_env.nsg_ssh_rule_id
}

output "nic_nsg_association_id" {
  value = module.linux_vm_env.nic_nsg_association_id
}

output "virtual_machine_id" {
  value = module.linux_vm_env.virtual_machine_id
}

output "virtual_machine_os_disk_id" {
  value = module.linux_vm_env.virtual_machine_os_disk_id
}

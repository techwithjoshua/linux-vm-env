variable "subscription_id" {
  default = ""
}

variable "resource_group_name" {
  default = "terraform_linux_vm_env"
}

variable "resource_group_location" {
  default = "East US"
}

variable "vnet_name" {
  default = "linux_vm_env_vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "linux_vm_env_subnet"
}

variable "subnet_address_prefixes" {
  default = ["10.0.1.0/24"]
}

variable "public_ip_name" {
  default = "linux_vm_env_public_ip"
}

variable "public_ip_allocation_method" {
  default = "Dynamic"
}

variable "public_ip_sku" {
  default = "Basic"
}

variable "nic_name" {
  default = "linux_vm_env_network_interface"
}

variable "nic_ip_config_name" {
  default = "linux_vm_env_nic_ip_config_name"
}

variable "nic_ip_config_private_allocation" {
  default = "Dynamic"
}

variable "nsg_name" {
  default = "linux_vm_env_network_security_group"
}

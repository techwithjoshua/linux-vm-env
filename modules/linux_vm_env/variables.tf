variable "resource_group_name" {}
variable "resource_group_location" {}

variable "vnet_name" {}
variable "vnet_address_space" {}

variable "subnet_name" {}
variable "subnet_virtual_network_name" {}
variable "subnet_address_prefixes" {}

variable "public_ip_name" {}
variable "public_ip_allocation_method" {}
variable "public_ip_sku" {}

variable "nic_name" {}
variable "nic_ip_config_name" {}
variable "nic_ip_config_private_allocation" {}

variable "nsg_name" {}

variable "vm_name" {}
variable "vm_size" {}
variable "vm_computer_name" {}
variable "vm_admin_username" {}
variable "vm_os_disk_name" {}
variable "vm_os_disk_caching" {}
variable "vm_os_disk_storage_account_type" {}
variable "vm_image_publisher" {}
variable "vm_image_offer" {}
variable "vm_image_sku" {}
variable "vm_image_version" {}

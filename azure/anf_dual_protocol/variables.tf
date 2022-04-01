variable "az_location" {
  description = "Azure Region"
}

variable "az_prefix" {
  description = "The prefix used for all resources used by this NetApp Volume"
}

variable "az_vnet_address_space" {
    description = "The address space used by the virtual network"
}

variable "az_subnet_address_prefix" {
    description = "The address prefix used to create the subnet"
}

variable "az_volume_path" {
  description = "path used to create volume"
}

variable "az_capacity_pool_size" {
  description = "Enter the size in Tb for the netapp capacity pool"
}

variable "az_vnet_creation_bool" {
  description = "Do you want to create a new vnet?"
  type = bool
}

variable "az_subnet_creation_bool" {
  description = "Do you want to create a new Subnet?"
  type = bool
}

variable "az_subnet_id_for_anf_vol" {
  description = "Enter the Subnet ID needed for creating ANF volume"
}

variable "az_netapp_pool_service_level" {
  description = "Enter the service level for creating the netapp pool"
}

variable "az_netapp_vol_service_level" {
  description = "Enter the service level to be used to create the new netapp ANF volume"
}

variable "az_netapp_vol_protocol1" {
  description = "Enter the first protocol to be used for the new netapp volume"
}

variable "az_netapp_vol_protocol2" {
  description = "Enter the second protocol to be used for the new netapp volume"
}

variable "az_netapp_vol_storage_quota" {
  description = "Enter the Storage quota in GB for the new netapp volume"
}


variable "az_smb_server_username" {
  description = "Username to create ActiveDirectory object"
}

variable "az_smb_server_password" {
  description = "User password to create ActiveDirectory object"
}

variable "az_smb_server_name" {
  description = "Server Name to create ActiveDirectory object."
}

variable "az_smb_dns_servers" {
  description = "DNS Server IP to create ActiveDirectory object."
}

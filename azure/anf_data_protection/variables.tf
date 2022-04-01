variable "az_location" {
  description = "Azure Region"
}

variable "az_prefix" {
  description = "The prefix used for all resources used by this NetApp Volume"
}

variable "az_vnet_primary_address_space" {
    description = "The address space used by the primary virtual network"
}

variable "az_vnet_secondary_address_space" {
    description = "The address space used by the secondary virtual network"
}

variable "az_subnet_primary_address_prefix" {
    description = "The address prefix used to create the primary subnet"
}

variable "az_subnet_secondary_address_prefix" {
    description = "The address prefix used to create the secondary subnet"
}

variable "az_volume_path_primary" {
  description = "path used to create primary volume"
}

variable "az_volume_path_secondary" {
  description = "path used to create secondary volume"
}

variable "az_capacity_pool_size_primary" {
  description = "Enter the size in Tb for the primary netapp capacity pool"
}

variable "az_capacity_pool_size_secondary" {
  description = "Enter the size in Tb for the secondary netapp capacity pool"
}

variable "az_vnet_primary_creation_bool" {
  description = "Do you want to create a new primary vnet?"
  type = bool
}

variable "az_vnet_secondary_creation_bool" {
  description = "Do you want to create a new secondary vnet?"
  type = bool
}

variable "az_subnet_primary_creation_bool" {
  description = "Do you want to create a new primary Subnet?"
  type = bool
}

variable "az_subnet_secondary_creation_bool" {
  description = "Do you want to create a new secondary Subnet?"
  type = bool
}

variable "az_primary_subnet_id_for_anf_vol" {
  description = "Enter the primary Subnet ID needed for creating ANF volume"
}

variable "az_secondary_subnet_id_for_anf_vol" {
  description = "Enter the secondary Subnet ID needed for creating ANF volume"
}

variable "az_netapp_pool_service_level_primary" {
  description = "Enter the primary service level for creating the netapp pool"
}

variable "az_netapp_pool_service_level_secondary" {
  description = "Enter the secondary service level for creating the netapp pool"
}

variable "az_netapp_vol_service_level_primary" {
  description = "Enter the primary service level to be used to create the new netapp ANF volume"
}

variable "az_netapp_vol_service_level_secondary" {
  description = "Enter the secondary service level to be used to create the new netapp ANF volume"
}

variable "az_netapp_vol_protocol_primary" {
  description = "Enter the primary protocol to be used for the new netapp volume"
}

variable "az_netapp_vol_protocol_secondary" {
  description = "Enter the secondary protocol to be used for the new netapp volume"
}


variable "az_netapp_vol_storage_quota_primary" {
  description = "Enter the primary Storage quota in GB for the new netapp volume"
}

variable "az_netapp_vol_storage_quota_secondary" {
  description = "Enter the secondary Storage quota in GB for the new netapp volume"
}

variable "az_dp_replication_frequency" {
  description = "Enter the frequency of CRR required"
}

variable "az_alt_location" {
  description = "The Azure location where the secondary volume will be created."
}

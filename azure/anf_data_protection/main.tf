terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.81.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}


resource "azurerm_resource_group" "example" {
  name     = "${var.az_prefix}-resources"
  location = var.az_location
}

resource "azurerm_virtual_network" "example_primary" {
  count = var.az_vnet_primary_creation_bool ? 1:0
  name                = "${var.az_prefix}-virtualnetwork-primary"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.az_vnet_primary_address_space]
}

resource "azurerm_subnet" "example_primary" {
  count = var.az_subnet_primary_creation_bool ? 1:0
  name                 = "${var.az_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_primary[0].name
  address_prefixes     = [var.az_subnet_primary_address_prefix]

  delegation {
    name = "testdelegation"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_virtual_network" "example_secondary" {
  count = var.az_vnet_secondary_creation_bool ? 1:0
  name                = "${var.az_prefix}-virtualnetwork-secondary"
  location            = var.az_alt_location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.az_vnet_secondary_address_space]
}

resource "azurerm_subnet" "example_secondary" {
  count = var.az_subnet_secondary_creation_bool ? 1:0
  name                 = "${var.az_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_secondary[0].name
  address_prefixes     = [var.az_subnet_secondary_address_prefix]

  delegation {
    name = "testdelegation"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_netapp_account" "example_primary" {
  name                = "${var.az_prefix}-netappaccount-primary"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_netapp_account" "example_secondary" {
  name                = "${var.az_prefix}-netappaccount-secondary"
  location            = var.az_alt_location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_netapp_pool" "example_primary" {
  name                = "${var.az_prefix}-netapppool-primary"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  account_name        = azurerm_netapp_account.example_primary.name
  service_level       = var.az_netapp_pool_service_level_primary
  size_in_tb          = var.az_capacity_pool_size_primary
}

resource "azurerm_netapp_pool" "example_secondary" {
  name                = "${var.az_prefix}-netapppool-secondary"
  location            = var.az_alt_location
  resource_group_name = azurerm_resource_group.example.name
  account_name        = azurerm_netapp_account.example_secondary.name
  service_level       = var.az_netapp_pool_service_level_secondary
  size_in_tb          = var.az_capacity_pool_size_secondary
}

locals {
  subnet_id_value_primary = var.az_subnet_primary_creation_bool ? azurerm_subnet.example_primary[0].id : var.az_primary_subnet_id_for_anf_vol
  subnet_id_value_secondary = var.az_subnet_secondary_creation_bool ? azurerm_subnet.example_secondary[0].id : var.az_secondary_subnet_id_for_anf_vol
}

resource "azurerm_netapp_volume" "example_primary" {
  name                = "${var.az_prefix}-netappvolume-primary"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  account_name        = azurerm_netapp_account.example_primary.name
  pool_name           = azurerm_netapp_pool.example_primary.name
  volume_path         = var.az_volume_path_primary
  service_level       = var.az_netapp_vol_service_level_primary
  protocols           = [var.az_netapp_vol_protocol_primary]
  subnet_id           = local.subnet_id_value_primary
  storage_quota_in_gb = var.az_netapp_vol_storage_quota_primary

  export_policy_rule {
    rule_index        = 1
    allowed_clients   = ["0.0.0.0/0"]
    protocols_enabled = [var.az_netapp_vol_protocol_primary]
    unix_read_only    = false
    unix_read_write   = true
  }
}

resource "azurerm_netapp_volume" "example_secondary" {
  depends_on = [azurerm_netapp_volume.example_primary]

  name                = "${var.az_prefix}-netappvolume-secondary"
  location            = var.az_alt_location
  resource_group_name = azurerm_resource_group.example.name
  account_name        = azurerm_netapp_account.example_secondary.name
  pool_name           = azurerm_netapp_pool.example_secondary.name
  volume_path         = var.az_volume_path_secondary
  service_level       = var.az_netapp_vol_service_level_secondary
  protocols           = [var.az_netapp_vol_protocol_secondary]
  subnet_id           = local.subnet_id_value_secondary
  storage_quota_in_gb = var.az_netapp_vol_storage_quota_secondary

  export_policy_rule {
    rule_index        = 1
    allowed_clients   = ["0.0.0.0/0"]
    protocols_enabled = [var.az_netapp_vol_protocol_secondary]
    unix_read_only    = false
    unix_read_write   = true
  }

  data_protection_replication {
    endpoint_type             = "dst"
    remote_volume_location    = azurerm_resource_group.example.location
    remote_volume_resource_id = azurerm_netapp_volume.example_primary.id
    replication_frequency     = var.az_dp_replication_frequency
  }
}

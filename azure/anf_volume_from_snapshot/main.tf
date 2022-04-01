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

resource "azurerm_virtual_network" "example" {
  count = var.az_vnet_creation_bool ? 1:0
  name                = "${var.az_prefix}-virtualnetwork"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [var.az_vnet_address_space]
}

resource "azurerm_subnet" "example" {
  count = var.az_subnet_creation_bool ? 1:0
  name                 = "${var.az_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example[0].name
  address_prefixes     = [var.az_subnet_address_prefix]

  delegation {
    name = "netapp"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_netapp_account" "example" {
  name                = "${var.az_prefix}-netappaccount"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_netapp_pool" "example" {
  name                = "${var.az_prefix}-netapppool"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  account_name        = azurerm_netapp_account.example.name
  service_level       = var.az_netapp_pool_service_level
  size_in_tb          = var.az_capacity_pool_size
}

locals {
  subnet_id_value = var.az_subnet_creation_bool ? azurerm_subnet.example[0].id : var.az_subnet_id_for_anf_vol
}


resource "azurerm_netapp_volume" "example-snapshot" {
  name                             = "${var.az_prefix}-netappvolume-snapshot"
  location                         = azurerm_resource_group.example.location
  resource_group_name              = azurerm_resource_group.example.name
  account_name                     = azurerm_netapp_account.example.name
  pool_name                        = azurerm_netapp_pool.example.name
  volume_path                      = "${var.az_prefix}-netappvolume-snapshot"
  service_level                    = var.az_netapp_vol_service_level
  protocols                        = [var.az_netapp_vol_protocol]
  subnet_id                        = local.subnet_id_value
  storage_quota_in_gb              = var.az_netapp_vol_storage_quota
  create_from_snapshot_resource_id = var.az_snapshot_id

  export_policy_rule {
    rule_index        = 1
    allowed_clients   = ["0.0.0.0/0"]
    protocols_enabled = [var.az_netapp_vol_protocol]
    unix_read_write   = true
  }
}

terraform {  
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
    }
  }
}

provider "netapp-cloudmanager" {
  refresh_token = var.refresh_token
}

resource "netapp-cloudmanager_connector_gcp" "gcp-connector-terraform" {
  count = var.gcp_connector_deploy_bool ? 1:0
  provider = netapp-cloudmanager
  name = var.gcp_connector_name
  project_id = var.gcp_connector_project_id
  zone = var.gcp_connector_zone
  company = var.gcp_connector_company
  service_account_email = var.gcp_connector_service_account_email
  service_account_path = var.gcp_connector_service_account_path 
  account_id = var.gcp_connector_account_id
}

locals {
  connector_client_id = var.gcp_connector_deploy_bool ? netapp-cloudmanager_connector_gcp.gcp-connector-terraform[0].client_id : var.gcp_connector_client_id
}

resource "netapp-cloudmanager_cvo_gcp" "gcp-cvo-terraform" {
  is_ha = var.gcp_cvo_is_ha
  provider = netapp-cloudmanager
  name = var.gcp_cvo_name
  project_id = var.gcp_cvo_project_id
  zone = var.gcp_cvo_zone
  node1_zone = var.gcp_cvo_node1_zone
  node2_zone = var.gcp_cvo_node2_zone
  mediator_zone = var.gcp_cvo_mediator_zone
  vpc_id = var.gcp_cvo_vpc_id
  subnet_id = var.gcp_cvo_subnet_id
  vpc0_node_and_data_connectivity = var.gcp_cvo_vpc0_node_and_data_connectivity
  vpc1_cluster_connectivity = var.gcp_cvo_vpc1_cluster_connectivity
  vpc2_ha_connectivity = var.gcp_cvo_vpc2_ha_connectivity
  vpc3_data_replication = var.gcp_cvo_vpc3_data_replication
  subnet0_node_and_data_connectivity = var.gcp_cvo_subnet0_node_and_data_connectivity
  subnet1_cluster_connectivity = var.gcp_cvo_subnet1_cluster_connectivity
  subnet2_ha_connectivity = var.gcp_cvo_subnet2_ha_connectivity
  subnet3_data_replication = var.gcp_cvo_subnet3_data_replication
  gcp_service_account = var.gcp_cvo_gcp_service_account
  svm_password = var.gcp_cvo_svm_password
  client_id = locals.connector_client_id
  workspace_id = var.gcp_cvo_workspace_id
  license_type = var.gcp_cvo_license_type
  capacity_package_name = var.gcp_cvo_capacity_package_name
  gcp_volume_size = var.gcp_cvo_gcp_volume_size
  gcp_volume_size_unit = var.gcp_cvo_gcp_volume_size_unit
}

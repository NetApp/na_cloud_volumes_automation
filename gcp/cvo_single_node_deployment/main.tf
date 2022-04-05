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


resource "netapp-cloudmanager_cvo_gcp" "cl-cvo-gcp" {
  provider = netapp-cloudmanager
  name = var.gcp_cvo_name
  project_id = var.gcp_cvo_project_id
  zone = var.gcp_cvo_zone
  gcp_service_account = var.gcp_cvo_gcp_service_account
  svm_password = var.gcp_cvo_svm_password
  client_id = locals.connector_client_id
  workspace_id = var.gcp_cvo_workspace_id
  license_type = var.gcp_cvo_license_type
  capacity_package_name = var.gcp_cvo_capacity_package_name
}
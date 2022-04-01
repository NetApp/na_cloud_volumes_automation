terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = "21.11.0"
    }
  }
}

provider "netapp-cloudmanager" {
  refresh_token = var.refresh_token
}

resource "netapp-cloudmanager_connector_aws" "aws-connector-terraform" {
  count = var.aws_connector_deploy_bool ? 1:0
  provider = netapp-cloudmanager
  name =  var.aws_connector_name
  region = var.aws_connector_region
  key_name = var.aws_connector_key_name
  company = var.aws_connector_company
  instance_type = var.aws_connector_instance_type
  subnet_id = var.aws_connector_subnet_id
  security_group_id = var.aws_connector_security_group_id
  iam_instance_profile_name = var.aws_connector_iam_instance_profile_name
  account_id = var.aws_connector_account_id
  associate_public_ip_address = var.aws_connector_public_ip_bool
}

resource "netapp-cloudmanager_aws_fsx" "aws-fsx" {
  provider = netapp-cloudmanager
  name = var.fsx_name
  region = var.fsx_region
  primary_subnet_id = var.fsx_primary_subnet_id
  secondary_subnet_id = var.fsx_secondary_subnet_id
  tenant_id = var.fsx_account_id
  workspace_id = var.fsx_workspace_id
  fsx_admin_password = var.fsx_admin_password
  throughput_capacity = var.fsx_throughput_capacity
  storage_capacity_size = var.fsx_storage_capacity_size
  storage_capacity_size_unit = var.fsx_storage_capacity_size_unit
  aws_credentials_name = var.fsx_cloudmanager_aws_credential_name
}

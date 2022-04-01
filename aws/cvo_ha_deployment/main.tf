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

resource "netapp-cloudmanager_connector_aws" "aws-connector-terraform" {
  #count = var.aws_connector_deploy_bool && var.aws_ha_create ? 1:0
  count = var.aws_connector_deploy_bool ? 1:0
  provider = netapp-cloudmanager
  name = var.aws_connector_name
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

locals {
  #connector_client_id = var.aws_connector_deploy_bool && var.aws_ha_create ? netapp-cloudmanager_connector_aws.aws-connector-terraform[0].client_id : var.aws_connector_client_id
  connector_client_id = var.aws_connector_deploy_bool ? netapp-cloudmanager_connector_aws.aws-connector-terraform[0].client_id : var.aws_connector_client_id
}

resource "netapp-cloudmanager_cvo_aws" "aws_cvo_terraform" {
  #count = var.aws_ha_create ? 1:0
  provider = netapp-cloudmanager
  name = var.cvo_name
  region = var.cvo_region
  vpc_id = var.cvo_vpc_id
  svm_password = var.cvo_svm_password
  client_id = local.connector_client_id
  is_ha = var.cvo_is_ha
  failover_mode = var.cvo_failover_mode
  node1_subnet_id = var.cvo_node1_subnet_id
  node2_subnet_id = var.cvo_node2_subnet_id
  mediator_subnet_id = var.cvo_mediator_subnet_id
  mediator_key_pair_name = var.cvo_mediator_key_pair_name
  cluster_floating_ip = var.cvo_cluster_floating_ip
  data_floating_ip = var.cvo_data_floating_ip
  data_floating_ip2 = var.cvo_data_floating_ip2
  svm_floating_ip = var.cvo_svm_floating_ip
  route_table_ids = var.cvo_route_table_ids
  license_type = var.cvo_license_type
}

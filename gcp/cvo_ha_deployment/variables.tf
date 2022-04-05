variable "refresh_token" {
  description = "The refresh token from NetApp cloud manager."
}

variable "gcp_connector_deploy_bool" {
  description = "Do you want to create a new GCP Connector?"
  type = bool
}

variable "gcp_connector_client_id" {
  description = "ID of GCP Connector instance"
}

variable "gcp_connector_name" {
  description = "Name of the GCP Connector"
}

variable "gcp_connector_project_id" {
    description = "Project ID for GCP Connector deployment"
}

variable "gcp_connector_zone" {
    description = "Zone for GCP Connector"
}

variable "gcp_connector_company" {
  description = "Name of the org"
}

variable "gcp_connector_instance_type" {
  description = "Instance type for gcp connector"
}

variable "gcp_connector_service_account_email" {
  description = "Service Account E-Mail"
}

variable "gcp_connector_service_account_path" {
  description = "Path to the JSON GCP Key"
}

variable "gcp_connector_account_id" {
  description = "Connector account ID"
}

variable "gcp_cvo_is_ha"{
  description = "Do you want to deploy CVO in HA pair?"
  type = bool
}

variable "gcp_cvo_name" {
  description = "Name of the CVO Instance"
}

variable "gcp_cvo_project_id" {
    description = "Project ID for GCP CVO deployment"
}

variable "gcp_cvo_zone" {
  description = "Zone for NetApp CVO"
}

variable "gcp_cvo_node1_zone" {
  description = "Zone for NetApp CVO Node 1"
}

variable "gcp_cvo_node2_zone" {
  description = "Zone for NetApp CVO Zone 2"
}

variable "gcp_cvo_mediator_zone" {
  description = "Zone for NetApp CVO Mediator"
}

variable "gcp_cvo_subnet_id" {
  description = "CVO Subnet ID for CVO"
}

variable "gcp_cvo_subnet0_node_and_data_connectivity" {
  description = "CVO Subnet ID for node1"
}

variable "gcp_cvo_subnet1_cluster_connectivity" {
  description = "CVO Subnet ID for node2"
}

variable "gcp_cvo_subnet2_ha_connectivity" {
  description = "CVO Subnet ID for node3"
}

variable "gcp_cvo_subnet3_data_replication" {
  description = "CVO Subnet ID for node4"
}

variable "gcp_cvo_vpc_id" {
  description = "CVO VPC ID"
}

variable "gcp_cvo_vpc0_node_and_data_connectivity" {
  description = "CVO VPC ID node1"
}

variable "gcp_cvo_vpc1_cluster_connectivity" {
  description = "CVO VPC ID node2"
}

variable "gcp_cvo_vpc2_ha_connectivity" {
  description = "CVO VPC ID node3"
}

variable "gcp_cvo_vpc3_data_replication" {
  description = "CVO VPC ID node4"
}

variable "gcp_cvo_gcp_service_account" {
  description = "Service Account E-Mail"
}

variable "gcp_cvo_svm_password" {
  description = "CVO SVM Password"
}

variable "gcp_cvo_workspace_id" {
  description = "CVO Cloud Manager Workspace ID"
}

variable "gcp_cvo_license_type" {
  description = "CVO License Type"
}

variable "gcp_cvo_capacity_package_name" {
  description = "CVO Capacity Package Name"
}

variable "gcp_cvo_gcp_volume_size" {
  description = "CVO Volume Size"
}

variable "gcp_cvo_gcp_volume_size_unit" {
  description = "CVO Volume Size Unit"
}

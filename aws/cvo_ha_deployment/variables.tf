variable "refresh_token" {
  description = "The refresh token from NetApp cloud manager."
}

variable "aws_connector_deploy_bool" {
  description = "Do you want to create a new AWS Connector?"
  type = bool
}

variable "aws_connector_client_id" {
  description = "ID of AWS Connector instance"
}

variable "aws_connector_name" {
  description = "Name of the AWS Connector"
}

variable "aws_connector_region" {
    description = "Region for AWS Connector deployment"
}

variable "aws_connector_key_name" {
    description = "Key name for AWS Connector"
}

variable "aws_connector_company" {
  description = "Name of the org"
}

variable "aws_connector_instance_type" {
  description = "Instance type for AWS connector"
}

variable "aws_connector_subnet_id" {
  description = "Subnet ID"
}

variable "aws_connector_security_group_id" {
  description = "Security group ID"
}

variable "aws_connector_iam_instance_profile_name" {
  description = "Profile name of the IAM account for connector"
}

variable "aws_connector_account_id" {
  description = "Connector account ID"
}

variable "aws_connector_public_ip_bool" {
  description = "Do you want to link a public IP?"
  type = bool
}

variable "cvo_name" {
  description = "Name of the CVO Instance"
}

variable "cvo_region" {
  description = "Region for NetApp CVO"
}

variable "cvo_is_ha"{
  description = "Do you want to deploy CVO in HA pair?"
  type = bool
}

variable "cvo_failover_mode" {
  description = "Failover mode for NetApp CVO"
}

variable "cvo_node1_subnet_id" {
  description = "CVO Subnet ID for node1"
}

variable "cvo_node2_subnet_id" {
  description = "CVO Subnet ID for node2"
}

variable "cvo_mediator_subnet_id" {
  description = "CVO Subnet ID for mediator"
}

variable "cvo_mediator_key_pair_name" {
  description = "CVO Key Pair name for mediator"
}

variable "cvo_cluster_floating_ip" {
  description = "CVO Cluster Floating IP"
}

variable "cvo_data_floating_ip" {
  description = "CVO Data Floating IP 1"
}

variable "cvo_data_floating_ip2" {
  description = "CVO Data Floating IP 2"
}

variable "cvo_svm_floating_ip" {
  description = "CVO SVM Floating IP"
}

variable "cvo_route_table_ids" {
  description = "CVO List of route table IDs"
  type = list(string)
}

variable "cvo_vpc_id" {
  description = "CVO VPC ID"
}

variable "cvo_svm_password" {
  description = "CVO SVM Password"
}

variable "cvo_license_type" {
  description = "CVO License Type"
}

#variable "aws_ha_create" {

#}

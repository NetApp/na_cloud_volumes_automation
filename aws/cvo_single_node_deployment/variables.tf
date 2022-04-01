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

variable "cvo_subnet_id" {
  description = "CVO Subnet ID"
}

variable "cvo_vpc_id" {
  description = "CVO VPC ID"
}

variable "cvo_svm_password" {
  description = "CVO SVM Password"
}

variable "cvo_writing_speed_state" {
  description = "CVO Writing speed state"
}

#variable "aws_sn_create" {

#}

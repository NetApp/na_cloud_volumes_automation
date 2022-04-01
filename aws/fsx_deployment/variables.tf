variable "refresh_token" {
  description = "The refresh token from NetApp cloud manager."
}

variable "aws_connector_deploy_bool" {
  description = "Do you want to create a new AWS Connector?"
  type = bool
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

variable "fsx_name" {
  description = "Name of the FSX Instance"
}

variable "fsx_region" {
  description = "AWS Region for FSx"
}

variable "fsx_primary_subnet_id" {
  description = "FSx Primary Subnet ID"
}

variable "fsx_secondary_subnet_id" {
  description = "FSx Secondary Subnet ID"
}

variable "fsx_account_id" {
  description = "NetApp Cloudmanager Account ID for FSx deployment"
}

variable "fsx_workspace_id" {
  description = "NetApp Cloudmanager Workspace ID for FSx deployment"
}

variable "fsx_admin_password" {
  description = "FSx Admin Password"
}

variable "fsx_throughput_capacity" {
  description = "Throughput Capacity for AWS ONTAP FSx"
}

variable "fsx_storage_capacity_size" {
  description = "Storage Capacity Size for AWS ONTAP FSx"
}

variable "fsx_storage_capacity_size_unit" {
  description = "Storage Capacity Size Unit for AWS ONTAP FSx"
}

variable "fsx_cloudmanager_aws_credential_name" {
  description = "Netapp Cloudmanager Credential Name for FSx Deployment"
}

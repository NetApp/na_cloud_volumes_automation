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

variable "gcp_cvo_name" {
  description = "Name of the CVO Instance"
}

variable "gcp_cvo_project_id" {
    description = "Project ID for GCP CVO deployment"
}

variable "gcp_cvo_zone" {
  description = "Zone for NetApp CVO"
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
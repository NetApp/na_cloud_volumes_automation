
variable "gcp_cvs_gcp_service_account_path" {
  description = "Path to the JSON GCP Key"
}

variable "gcp_cvs_region" {
  description = "GCP Region for CVS volume"
}

variable "gcp_cvs_name" {
  description = "Name of the CVS Instance"
}

variable "gcp_cvs_project_id" {
    description = "Project ID for GCP CVS deployment"
}

variable "gcp_cvs_network" {
  description = "GCP VPC Network Name"
}

variable "gcp_cvs_size" {
  description = "CVS Volume Size in GB"
}

variable "gcp_cvs_volume_path" {
  description = "Volume Path"
}

variable "gcp_cvs_protocol_types" {
  description = "Protocol Type For NFS use 'NFSv3' or 'NFSv4' and for SMB use 'CIFS' or 'SMB'"
}

terraform {
  required_providers {
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "22.3.0"
	  }
  }
}

provider "netapp-gcp" {
  project         = var.gcp_cvs_project_id
  service_account = var.gcp_cvs_gcp_service_account_path
}

resource "netapp-gcp_volume" "gcp-volume" {
  provider = netapp-gcp
  name = var.gcp_cvs_name
  region = var.gcp_cvs_region
  protocol_types = [var.gcp_cvs_protocol_types]
  network = var.gcp_cvs_network
  size = var.gcp_cvs_size
  volume_path = var.gcp_cvs_volume_path
}

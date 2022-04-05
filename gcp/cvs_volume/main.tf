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

resource "netapp-cloudmanager_cvs_gcp_volume" "test1" {
  provider = netapp-cloudmanager
  name = "test_vol"
  size = 1024
  size_unit = "gb"
  volume_path = "test_vol"
  protocol_types = ["NFSv3"]
  region = "us-east4"
  service_level = "low"
  account = "demo"
  client_id = netapp-cloudmanager_connector_gcp.cl-occm-gcp.client_id
  network = "gcp-vpc-core"
  working_environment_name = "hamanual"
  export_policy {
    rule {
      allowed_clients = "0.0.0.0/0"
      rule_index = 1 
      unix_read_only= true
      unix_read_write = false
      nfsv3 = true
      nfsv4 = true
    }
    rule {
      allowed_clients= "10.0.0.0"
      rule_index = 2
      unix_read_only= true
      unix_read_write = false
      nfsv3 = true
      nfsv4 = true
    }
  }
  snapshot_policy {
    enabled = true
    hourly_schedule {
      snapshots_to_keep = 48
      minute = 1
    }
    daily_schedule {
      snapshots_to_keep = 14
      hour = 23
      minute = 2
    }
    weekly_schedule {
      snapshots_to_keep = 4
      hour = 1
      minute = 3
      day = "Monday"
    }
    monthly_schedule {
      snapshots_to_keep = 6
      hour = 2
      minute = 4
      days_of_month = 6
    }    
  }
}




terraform {  
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
    }
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "22.3.0"
	}
  }
}

provider "netapp-gcp" {
  project         = "rt1822926"
  service_account = "keygcp.json"
}

provider "netapp-cloudmanager" {
  refresh_token = "tEP9w2G53A-87kXfybkNymWs3M30qbmGruGit--z7pBWp"
}

resource "netapp-cloudmanager_connector_gcp" "cl-occm-gcp" {
  provider = netapp-cloudmanager
  name = "gcpvedanttest"
  project_id = "rt1822926"
  zone = "us-east4-a"
  company = "NetApp"
  service_account_email = "rt1822926@rt1822926.iam.gserviceaccount.com"
  service_account_path = "keygcp.json"
  account_id = "account-ptacNtpH"
}

resource "netapp-gcp_volume" "gcp-volume" {
  depends_on = [netapp-cloudmanager_connector_gcp.cl-occm-gcp]
  provider = netapp-gcp
  name = "test"
  region = "us-east4"
  protocol_types = ["NFSv3"]
  network = "gcp-vpc-core"
  size = 1024
  volume_path = "deleteme-asapGO"
  snapshot_policy {
    enabled = true
    daily_schedule {
      hour = 10
      minute = 1
    }
  }
  export_policy {
    rule {
      allowed_clients = "0.0.0.0/0"
      access= "ReadWrite"
      nfsv3 {
        checked =  true
      }
      nfsv4 {
        checked = false
      }
    }
    rule {
      allowed_clients= "10.0.0.0"
      access= "ReadWrite"
      nfsv3 {
        checked =  true
      }
      nfsv4 {
        checked = false
      }
    }
  }
}
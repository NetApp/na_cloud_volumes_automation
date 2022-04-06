# na_cloud_volumes_automation
Collection of Terraform configuration files to deploy NetApp Cloud Volumes (CVO, CVS, FSx, ANF) on Public Cloud Platforms (AWS, Microsoft Azure, GCP).

## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.

## Terraform Configuration Files for NetApp Cloud Volumes
This is an archive of Terraform configuration files to deploy NetApp Cloud Volumes on Public Clouds using Terraform.

These configuration files use NetApp cloud manager terraform provider and cloud terraform providers for AWS, Azure and GCP.

## Folder Contents
**AWS:** This folder contains various deployment and configuration scenarios for NetApp Cloud Volumes on AWS.  
**Azure:** This folder contains various deployment and configuration scenarios for NetApp Cloud Volumes on Microsoft Azure.  
**GCP:** This folder contains various deployment and configuration scenarios for NetApp Cloud Volumes on Google Cloud Platform.

## Requirements
1. Terraform >= 0.13
2. Cloud Manager Account
3. Cloud Provider Account – AWS, Azure, GCP
4. Host machine (any OS supported by Terraform)

## Provider documentation
The documentation of Terraform provider for Cloud Manager is available at: https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/latest/docs

The documentation of Terraform provider for AzureRM is available at: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

The documentation of Terraform provider for NetApp GCP is available at: https://registry.terraform.io/providers/NetApp/netapp-gcp/latest/docs

### Controlling the provider version
Note that you can also control the provider version. This is controlled by a required_providers block in your Terraform configuration.

The syntax is as follows:

- Cloudmanager Terraform Provider
```
terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = "20.10.0"
    }
  }
}
```

- Azure Terraform Provider
```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.81.0"
    }
  }
}
```
- NetApp GCP provider
```
terraform {
  required_providers {
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "22.3.0"
    }
  }
}
```

## Implementation

Detailed Steps can be found at: https://docs.netapp.com/us-en/netapp-solutions/automation/cloud_volumes_terraform.html

For running specific modules, refer to the READMEs available in the respective modules.

## Author Information
NetApp Solutions Engineering Team

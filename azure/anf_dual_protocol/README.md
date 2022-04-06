# na_terraform_anf_dual_protocol
Terraform template to deploy Azure Netapp Files (ANF) volume with dual protocol on Microsoft Azure from scratch.

## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  


## Terraform Template for Azure Netapp Files (ANF) Dual Protocol
This is an archive of Terraform configuration files to deploy Azure Netapp Files (ANF) with dual protocol using Terraform.

These templates use "azurerm" terraform provider.


## Folder Contents
This folder contains various deployment and configuration scenarios for Azure Netapp Files volume deployment.

## Requirements
1. Terraform >= 0.13
2. Cloud Provider Account – Azure
3. Host machine (any OS supported by Terraform)

## Provider documentation
The documentation is available at: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

### Controlling the provider version
Note that you can also control the provider version. This is controlled by a required_providers block in your Terraform configuration.

The syntax is as follows:

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

Read more on provider version control.

## Procedure
In order to run the template:
1. Clone the repository.

    ```git clone https://github.com/NetApp-Automation/na_cloud_volumes_automation.git```

2. Navigate to the desired folder

    ```cd na_cloud_volumes_automation/anf_dual_protocol```

3. Login to your Azure CLI (Azure CLI must be installed).

    ```az login```

4. Update the variable values in ```terraform.tfvars```.
      + You can choose to deploy the ANF volume using an existing vnet and subnet by setting the variable "vnet_creation_bool" and "subnet_creation_bool" value to false and supplying the "subnet_id_for_anf_vol". You can also set those values to true and create a new vnet and subnet in which case, the subnet ID will automatically be taken from the newly created subnet.


5. Initialize the Terraform repository to install all the pre-requisites and prepare for deployment.

    ```terraform init```

6. Verify the terraform files using terraform validate command.

    ```terraform validate```

7. Make a dry run of the configuration to get a preview of all the changes expected by the deployment.

    ```terraform plan```

8. Run the deployment

    ```terraform apply```

To delete the deployment

  ```terraform destroy```

## Recipies:

### Single Node Instance
This template will deploy a single ANF Volume with dual protocol enabled into the designated Azure subnet.

| Name | Type | Description |
| --- | --- | --- |
| `az_location ` | String | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. |
| `az_prefix` | String | (Required) The name of the resource group where the NetApp Volume should be created. Changing this forces a new resource to be created. |
| `az_vnet_address_space` | String | (Required) The address space to be used by the newly created vnet for ANF volume deployment. |
| `az_subnet_address_prefix` | String | (Required) The subnet address prefix to be used by the newly created vnet for ANF volume deployment. |
| `az_volume_path` | String | (Required) A unique file path for the volume. Used when creating mount targets. Changing this forces a new resource to be created. |
| `az_capacity_pool_size` | Integer | (Required) Capactiy Pool Size mentioned in TB. |
| `az_vnet_creation_bool` | Boolean | (Required) Set this boolean to `true` if you want to create a new vnet. Set it to `false` to use an existing vnet. |
| `az_subnet_creation_bool` | Boolean | (Required) Set this boolean to `true` to create a new subnet. Set it to `false` to use an existing subnet. |
| `az_subnet_id_for_anf_vol` | String | (Required) Mention the subnet id in case you decide to use an existing subnet by setting `subnet_creation_bool` to true. If set to false, leave it at the default value. |
| `az_netapp_pool_service_level` | String | (Required) The target performance of the file system. Valid values include `Premium` , `Standard` , or `Ultra`. |
| `az_netapp_vol_service_level` | String | (Required) The target performance of the file system. Valid values include `Premium` , `Standard` , or `Ultra`. |
| `az_netapp_vol_protocol1` | String | (Required) The target volume protocol expressed as a list. Supported single value include `CIFS`, `NFSv3`, or `NFSv4.1`. If argument is not defined it will default to `NFSv3`. Changing this forces a new resource to be created and data will be lost. |
| `az_netapp_vol_protocol2` | String | (Required) The target volume protocol expressed as a list. Supported single value include `CIFS`, `NFSv3`, or `NFSv4.1`. If argument is not defined it will default to `NFSv3`. Changing this forces a new resource to be created and data will be lost. |
| `az_netapp_vol_storage_quota` | String | (Required) The maximum Storage Quota allowed for a file system in Gigabytes. |
| `az_smb_server_username` | String | (Required) Username to create ActiveDirectory object. |
| `az_smb_server_password` | String | (Required) User Password to create ActiveDirectory object. |
| `az_smb_server_name` | String | (Required) Server Name to create ActiveDirectory object. |
| `az_smb_dns_servers` | String | (Required) DNS Server IP to create ActiveDirectory object. |




## Author Information
NetApp Solutions Engineering Team

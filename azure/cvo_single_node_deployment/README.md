# na_terraform_az_cvo_sn
Terraform template to deploy a single node Cloud Volumes ONTAP (CVO) on Microsoft Azure from scratch.

## Terraform Template for Cloud Volumes ONTAP (CVO) Single Node
This is an archive of Terraform configuration files to deploy Cloud Volumes ONTAP (CVO)  single node using Terraform.

These templates use "netapp-cloudmanager" terraform provider.


## Folder Contents
This folder contains various deployment and configuration scenarios for Cloud Volumes ONTAP (CVO) single node deployment.

## Requirements
1. Terraform >= 0.13
2. Cloud Provider Account – Azure
3. Host machine (any OS supported by Terraform)
4. JQ (sudo apt-get install jq or equivalent)
5. Connector created on Cloud Manager through the script should have connectivity to the host from where this terraform script is running.

## Provider documentation
The documentation is available at: https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/latest/docs

### Controlling the provider version
Note that you can also control the provider version. This is controlled by a required_providers block in your Terraform configuration.

The syntax is as follows:

```
terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = "21.11.0"
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

    ```cd na_cloud_volumes_automation/cvo_single_node_deployment```

3. Login to your Azure CLI (Azure CLI must be installed).

    ```az login```

4. Update the variables in ```terraform.tfvars```.

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
This template will deploy a single node Cloud Volumes ONTAP (CVO) into the designated Azure subnet.

| Name | Type | Description |
| --- | --- | --- |
| `refresh_token ` | String | (Required) The refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central. |
| `az_connector_name` | String | (Required) The name of the Cloud Manager Connector. |
| `az_connector_location` | String | (Required) The location where the Cloud Manager Connector will be created. |
| `az_connector_subscription_id` | String | (Required) The ID of the Azure subscription. |
| `az_connector_company` | String | (Required) The name of the company of the user. |
| `az_connector_resource_group` | Integer | (Required) The resource group in Azure where the resources will be created. |
| `az_connector_subnet_id` | String | (Required) The name of the subnet for the virtual machine. |
| `az_connector_vnet_id` | String | (Required) The name of the virtual network. |
| `az_connector_network_security_group_name` | String | (Required) The name of the security group for the instance. |
| `az_connector_associate_public_ip_address` | String | (Required) Indicates whether to associate the public IP address to the virtual machine. |
| `az_connector_account_id` | String | (Required) The NetApp account ID that the Connector will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com. |
| `az_connector_admin_password` | String | (Required) The password for the Connector. |
| `az_connector_admin_username` | String | (Required) The user name for the Connector. |
| `az_cvo_name` | String | (Required) The name of the Cloud Volumes ONTAP working environment. |
| `az_cvo_location` | String | (Required) TThe location where the working environment will be created. |
| `az_cvo_subnet_id` | String | (Required) TThe name of the subnet for the Cloud Volumes ONTAP system. |
| `az_cvo_vnet_id` | String | (Required) TThe name of the virtual network. |
| `az_cvo_vnet_resource_group` | String | (Required) The resource group in Azure associated to the virtual network. |
| `az_cvo_data_encryption_type` | String | (Required) The type of encryption to use for the working environment: [```AZURE```, ```NONE```]. The default is ```AZURE```. |
| `az_cvo_storage_type` | String | (Required) The type of storage for the first data aggregate: [```Premium_LRS```, ```Standard_LRS```, ```StandardSSD_LRS```]. The default is ```Premium_LRS``` |
| `az_cvo_svm_password` | String | (Required) The admin password for Cloud Volumes ONTAP. |
| `az_cvo_workspace_id` | String | (Required) The ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace tab on https://cloudmanager.netapp.com. |
| `az_cvo_capacity_tier` | String | (Required) Whether to enable data tiering for the first data aggregate: [```Blob```, ```NONE```]. The default is ```BLOB```. |
| `az_cvo_writing_speed_state` | String | (Required) The write speed setting for Cloud Volumes ONTAP: [```NORMAL``` , ```HIGH```]. The default is ```NORMAL```. This argument is not relevant for HA pairs. |
| `az_cvo_ontap_version` | String | (Required) The required ONTAP version. Ignored if 'use_latest_version' is set to true. The default is to use the latest version. |
| `az_cvo_instance_type` | String | (Required) The type of instance to use, which depends on the license type you chose: Explore:[```Standard_DS3_v2```], Standard:[```Standard_DS4_v2,Standard_DS13_v2,Standard_L8s_v2```], Premium:[```Standard_DS5_v2```,```Standard_DS14_v2```], BYOL: all instance types defined for PayGo. For more supported instance types, refer to Cloud Volumes ONTAP Release Notes. The default is ```Standard_DS4_v2``` . |
| `az_cvo_license_type` | String | (Required) The type of license to be use. For single node: [```azure-cot-explore-paygo```, ```azure-cot-standard-paygo```, ```azure-cot-premium-paygo```, ```azure-cot-premium-byol```, ```capacity-paygo```]. For HA: [```azure-ha-cot-standard-paygo```, ```azure-ha-cot-premium-paygo```, ```azure-ha-cot-premium-byol```, ```ha-capacity-paygo```]. The default is ```azure-cot-standard-paygo```. Use ```capacity-paygo``` or ```ha-capacity-paygo``` for HA on selecting Bring Your Own License type Capacity-Based or Freemium. Use ```azure-cot-premium-byol``` or ```azure-ha-cot-premium-byol``` for HA on selecting Bring Your Own License type Node-Based. |
| `az_cvo_nss_account` | String | (Required) he NetApp Support Site account ID to use with this Cloud Volumes ONTAP system. If the license type is BYOL and an NSS account isn't provided, Cloud Manager tries to use the first existing NSS account. |
| `az_tenant_id` | String | (Required) Tenant ID of the application/service principal registered in Azure. |
| `az_application_id` | String | (Required) Application ID of the application/service principal registered in Azure. |
| `az_application_key` | String | (Required) The Application Key of the application/service principal registered in Azure. |

## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  

## Author Information
NetApp Solutions Engineering Team

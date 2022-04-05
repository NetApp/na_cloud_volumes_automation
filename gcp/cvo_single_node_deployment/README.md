## Terraform configuration files for deployment of NetApp CVO (Single Node) on GCP
This section contains various Terraform configuration files to deploy/configure NetApp CVO (Cloud Volumes ONTAP) single node on GCP (Google Cloud Platform).

Terraform Documentation: https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/latest/docs

## Procedure
In order to run the template:
1. Clone the repository.
    ```
    git clone https://github.com/NetApp-Automation/na_cloud_volumes_automation.git
    ```
2. Navigate to the desired folder
    ```
    cd na_cloud_volumes_automation/gcp/cvo_single_node_deployment
    ```
3. Save the GCP authentication key JSON file in the directory.
    
4. Update the variable values in ```terraform.tfvars```. 
      + You can choose to deploy the connector by setting the variable "gcp_connector_deploy_bool" value to true/false.

5. Initialize the Terraform repository to install all the pre-requisites and prepare for deployment.
    ```
    terraform init
    ```
6. Verify the terraform files using terraform validate command.
    ```
    terraform validate
    ```
7. Make a dry run of the configuration to get a preview of all the changes expected by the deployment.
    ```
    terraform plan
    ```
8. Run the deployment
    ```
    terraform apply
    ```

To delete the deployment
    ```
    terraform destroy
    ```

## Recipies:

### Connector  
This section of the template will deploy a NetApp GCP connector instance for CVO deployment.

| Name | Type | Description |
| --- | --- | --- |
| `gcp_connector_deploy_bool ` | Bool | (Required) Check for Connector deployment.  |
| `gcp_connector_name` | String | (Required) The name of the Cloud Manager Connector. |
| `gcp_connector_project_id` | String | (Required) The GCP project_id where the connector will be created. |
| `gcp_connector_zone` | String | (Required) The GCP zone where the Connector will be created. |
| `gcp_connector_company` | String | (Required) The name of the company of the user. |
| `gcp_connector_service_account_email` | String | (Required) The email of the service_account for the connector instance. This service account is used to allow the Connector to create Cloud Volume ONTAP. |
| `gcp_connector_service_account_path` | String | (Required) The local path of the service_account JSON file for GCP authorization purposes. This service account is used to create the Connector in GCP.  |
| `gcp_connector_account_id` | String | (Optional) The NetApp account ID that the Connector will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com. |

### Single Node Instance
This template will deploy NetApp CVO instances in a single node as per the designated GCP VPC Networks. 

| Name | Type | Description |
| --- | --- | --- |
| `gcp_cvo_name ` | String | (Required) The name of the Cloud Volumes ONTAP working environment. |
| `gcp_cvo_project_id` | String | (Required) The ID of the GCP project. |
| `gcp_cvo_zone` | String | (Required) The zone of the region where the working environment will be created. |
| `gcp_cvo_gcp_service_account` | String | (Required) The gcp_service_account email in order to enable tiering of cold data to Google Cloud Storage. |
| `gcp_cvo_svm_password` | String | (Required) The admin password for Cloud Volumes ONTAP. |
| `gcp_cvo_workspace_id` | String | (Optional) The ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace tab on https://cloudmanager.netapp.com. |
| `gcp_cvo_license_type` | String | (Optional) The type of license to use. For single node: ['capacity-paygo', 'gcp-cot-explore-paygo', 'gcp-cot-standard-paygo', 'gcp-cot-premium-paygo', 'gcp-cot-premium-byol'], For HA: ['ha-capacity-paygo', 'gcp-ha-cot-explore-paygo', 'gcp-ha-cot-standard-paygo', 'gcp-ha-cot-premium-paygo', 'gcp-ha-cot-premium-byol']. The default is 'capacity-paygo' for single node, and 'ha-capacity-paygo'for HA. |
| `gcp_cvo_capacity_package_name` | String | (Optional) The capacity package name: ['Essential', 'Professional', 'Freemium']. Default is 'Essential'. |

## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  

## Author Information
NetApp Solutions Engineering Team

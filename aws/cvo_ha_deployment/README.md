## Terraform configuration files for deployment of NetApp CVO (HA Pair) on AWS
This section contains various Terraform configuration files to deploy/configure NetApp CVO (Cloud Volumes ONTAP) in high availability pair on AWS (Amazon Web Services).

Terraform Documentation: https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/latest/docs

## Procedure
In order to run the template:
1. Clone the repository.
    ```
    git clone https://github.com/NetApp/na_cloud_volumes_automation.git
    ```
2. Navigate to the desired folder
    ```
    cd na_cloud_volumes_automation/aws/cvo_ha_deployment
    ```
3. Configure AWS credentials from the CLI.
    ```
    aws configure
    ```

    - AWS Access Key ID [None]: accesskey
    - AWS Secret Access Key [None]: secretkey
    - Default region name [None]: us-west-2
    - Default output format [None]: json

4. Update the variable values in ```terraform.tfvars```.
      + You can choose to deploy the connector by setting the variable "aws_connector_deploy_bool" value to true/false.

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
This section of the template will deploy a NetApp AWS connector instance for CVO deployment.

| Name | Type | Description |
| --- | --- | --- |
| `aws_connector_deploy_bool ` | Bool | (Required) Check for Connector deployment.  |
| `aws_connector_name` | String | (Required) The name of the Cloud Manager Connector. |
| `aws_connector_region` | String | (Required) The region where the Cloud Manager Connector will be created. |
| `aws_connector_key_name` | String | (Required) The name of the key pair to use for the Connector instance. |
| `aws_connector_company` | String | (Required) The name of the company of the user. |
| `aws_connector_instance_type` | String | (Required) The type of instance (for example, t3.xlarge). At least 4 CPU and 16 GB of memory are required. |
| `aws_connector_subnet_id` | String | (Required) The ID of the subnet for the instance. |
| `aws_connector_security_group_id` | String | (Required) The ID of the security group for the instance, multiple security groups can be provided seperated by ','. |
| `aws_connector_iam_instance_profile_name` | String | (Required) The name of the instance profile for the Connector. |
| `aws_connector_account_id` | String | (Optional) The NetApp account ID that the Connector will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com. |
| `aws_connector_public_ip_bool` | Bool | (Optional)  Indicates whether to associate a public IP address to the instance. If not provided, the association will be done based on the subnet's configuration. |

### HA Pair
This template will deploy NetApp CVO instances in HA Pair as per the designated AWS subnet. As part of this process, an IAM EC2 Role will be used to provide the CVO instances with the correct credentials and security policy based on the sizing and design choices in the Terraform variables.

| Name | Type | Description |
| --- | --- | --- |
| `cvo_is_ha` | Bool | (Optional) Indicate whether the working environment is an HA pair or not [true, false]. The default is false. |
| `cvo_name ` | String | (Required) The name of the Cloud Volumes ONTAP working environment. |
| `cvo_region` | String | (Required) The region where the working environment will be created. |
| `cvo_node1_subnet_id` | String | (Required) The subnet id where the first node will be created. |
| `cvo_node2_subnet_id` | String | (Required) The subnet id where the second node will be created. |
| `cvo_vpc_id` | String | (Optional) The VPC ID where the working environment will be created. If this argument isn't provided, the VPC will be calculated by using the provided subnet ID. |
| `cvo_svm_password` | String | (Required) The admin password for Cloud Volumes ONTAP. |
| `cvo_failover_mode` | String | (Optional) For HA, the failover mode for the HA pair: ['PrivateIP', 'FloatingIP']. 'PrivateIP' is for a single availability zone and 'FloatingIP' is for multiple availability zones. |
| `cvo_mediator_subnet_id` | String | (Optional) For HA, the subnet ID of the mediator. |
| `cvo_mediator_key_pair_name` | String | (Optional) For HA, the key pair name for the mediator instance. |
| `cvo_cluster_floating_ip` | String | (Optional) For HA FloatingIP, the cluster management floating IP address. |
| `cvo_data_floating_ip` | String | (Optional) For HA FloatingIP, the data floating IP address. |
| `cvo_data_floating_ip2` | String | (Optional) For HA FloatingIP, the data floating IP address. |
| `cvo_svm_floating_ip` | String | (Optional) For HA FloatingIP, the SVM management floating IP address. |
| `cvo_route_table_ids` | List | (Optional) For HA FloatingIP, the list of route table IDs that will be updated with the floating IPs. |


## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  

## Author Information

- [Dhruv Tyagi](mailto:dhruv.tyagi@netapp.com) - NetApp Solutions Engineering Team
- [Vedant Sethia](mailto:vedant.sethia@netapp.com) - NetApp Solutions Engineering Team

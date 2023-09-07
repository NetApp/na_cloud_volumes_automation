## Terraform configuration files for deployment of NetApp ONTAP FSx on AWS
This section contains various Terraform configuration files to deploy/configure NetApp ONTAP FSx on AWS (Amazon Web Services).

Terraform Documentation: https://registry.terraform.io/providers/NetApp/netapp-cloudmanager/latest/docs

## Procedure
In order to run the template:
1. Clone the repository.

    ```git clone https://github.com/NetApp/na_cloud_volumes_automation.git```
2. Navigate to the desired folder

    ```cd na_cloud_volumes_automation/aws/fsx_deployment```
3. Configure AWS credentials from the CLI.
    ```
    aws configure
    ```

    - AWS Access Key ID [None]: accesskey
    - AWS Secret Access Key [None]: secretkey
    - Default region name [None]: us-west-2
    - Default output format [None]:

4. Update the variable values in ```terraform.tfvars```
      + You can choose to deploy the connector by setting the variable "aws_connector_deploy_bool" value to true/false.

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

### Connector  
This section of the template will deploy a NetApp AWS connector instance.

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

### FSx Instance
This template will deploy a NetApp ONTAP FSx instance into the designated AWS subnet.

| Name | Type | Description |
| --- | --- | --- |
| `fsx_name` | String | (Required) The name of the Cloud Volumes ONTAP working environment. |
| `fsx_region` | String | (Required) The region where the working environment will be created. |
| `fsx_primary_subnet_id` | String | (Required) The primary subnet id where the working environment will be created. |
| `fsx_secondary_subnet_id` | String | (Required) The secondary subnet id where the working environment will be created. |
| `fsx_account_id` | String | (Required) The NetApp account ID that the FSx instance will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com. |
| `fsx_workspace_id` | String | (Required) The ID of the Cloud Manager workspace of working environment. |
| `fsx_admin_password` | String | (Required) The admin password for Cloud Volumes ONTAP. |
| `fsx_throughput_capacity` | String | (Optional) capacity of the throughput. |
| `fsx_storage_capacity_size` | String | (Optional) EBS volume size for the first data aggregate. For GB, the unit can be: [100 or 500]. For TB, the unit can be: [1,2,4,8,16]. The default is '1' |
| `fsx_storage_capacity_size_unit` | String | (Optional) ['GB' or 'TB']. The default is 'TB'. |
| `fsx_cloudmanager_aws_credential_name` | String | (Required) The name of the AWS Credentials account name. |

## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  

## Author Information

- [Dhruv Tyagi](mailto:dhruv.tyagi@netapp.com) - NetApp Solutions Engineering Team
- [Vedant Sethia](mailto:vedant.sethia@netapp.com) - NetApp Solutions Engineering Team

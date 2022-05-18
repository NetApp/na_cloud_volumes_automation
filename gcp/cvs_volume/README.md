## Terraform configuration files for deployment of NetApp CVS on GCP
This section contains various Terraform configuration files to deploy/configure NetApp CVS (Cloud Volumes Service on GCP (Google Cloud Platform).

Terraform Documentation: https://registry.terraform.io/providers/NetApp/netapp-gcp/latest/docs

## Procedure
In order to run the template:
1. Clone the repository.
    ```
    git clone https://github.com/NetApp-Automation/na_cloud_volumes_automation.git
    ```
2. Navigate to the desired folder
    ```
    cd na_cloud_volumes_automation/gcp/cvs_volume
    ```
3. Save the GCP authentication key JSON file in the directory.

4. Update the variable values in ```terraform.tfvars```.

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

### CVS Volume  
This section of the template will deploy a NetApp CVS Volume on GCP.

| Name | Type | Description |
| --- | --- | --- |
| `gcp_cvs_name ` | String | (Required) The name of the NetApp CVS volume.  |
| `gcp_cvs_project_id` | String | (Required) The GCP project_id where the CVS Volume will be created. |
| `gcp_cvs_gcp_service_account_path` | String | (Required) The local path of the service_account JSON file for GCP authorization purposes. This service account is used to create the CVS Volume in GCP. |
| `gcp_cvs_region` | String | (Required) The GCP zone where the CVS Volume will be created. |
| `gcp_cvs_network` | String | (Required) The network VPC of the volume. |
| `gcp_cvs_size` | Integer | (Required) The size of volume is between 1024 to 102400 inclusive (in GiB). |
| `gcp_cvs_volume_path` | String | (Optional) The name of the volume path for volume.  |
| `gcp_cvs_protocol_types` | String | (Required) The protocol_type of the volume. For NFS use 'NFSv3' or 'NFSv4' and for SMB use 'CIFS' or 'SMB'. |


## License
By accessing, downloading, installing or using the content in this repository, you agree the terms of the License laid out in License file.

Note that there are certain restrictions around producing and/or sharing any derivative works with the content in this repository. Please make sure you read the terms of the License before using the content. If you do not agree to all of the terms, do not access, download or use the content in this repository.

Copyright: 2022 NetApp Inc.  

## Author Information

- [Dhruv Tyagi](mailto:dhruv.tyagi@netapp.com) - NetApp Solutions Engineering Team
- [Vedant Sethia](mailto:vedant.sethia@netapp.com) - NetApp Solutions Engineering Team

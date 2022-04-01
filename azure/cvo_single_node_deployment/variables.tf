
variable "refresh_token" {
    description = "The refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central."
}

variable az_connector_name {
    description = "The name of the Cloud Manager Connector."
}

variable az_connector_location {
    description = "The location where the Cloud Manager Connector will be created."
}

variable az_connector_subscription_id {
    description = "The ID of the Azure subscription."
}

variable az_connector_company {
    description = "The name of the company of the user."
}

variable az_connector_resource_group {
    description = "The resource group in Azure where the resources will be created."
}

variable az_connector_subnet_id {
    description = "The name of the subnet for the virtual machine."
}

variable az_connector_vnet_id {
    description = "The name of the virtual network."
}

variable az_connector_network_security_group_name{
    description = "The name of the security group for the instance."
}

variable az_connector_associate_public_ip_address{
    description = "Indicates whether to associate the public IP address to the virtual machine."
}

variable az_connector_account_id {
    description = "The NetApp account ID that the Connector will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com."
}

variable az_connector_admin_password {
    description = "The password for the Connector."
}

variable az_connector_admin_username {
    description = "The user name for the Connector."
}

variable az_cvo_name {
    description = "The name of the Cloud Volumes ONTAP working environment."
}

variable az_cvo_location {
    description = "The location where the working environment will be created."
}

variable az_cvo_subnet_id {
    description = "The name of the subnet for the Cloud Volumes ONTAP system."
}

variable az_cvo_vnet_id {
    description = "The name of the virtual network."
}

variable az_cvo_vnet_resource_group {
    description = "The resource group in Azure associated to the virtual network."
}

variable az_cvo_data_encryption_type {
    description = "The type of encryption to use for the working environment: ['AZURE', 'NONE']. The default is 'AZURE'."
}

variable az_cvo_storage_type {
    description = "The type of storage for the first data aggregate: ['Premium_LRS', 'Standard_LRS', 'StandardSSD_LRS']. The default is 'Premium_LRS'"
}

variable az_cvo_svm_password {
    description = "The admin password for Cloud Volumes ONTAP."
}

variable az_cvo_workspace_id {
    description = "The ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace tab on https://cloudmanager.netapp.com."
}

variable az_cvo_capacity_tier {
    description = "Whether to enable data tiering for the first data aggregate: ['Blob', 'NONE']. The default is 'BLOB'."
}

variable az_cvo_writing_speed_state {
    description = "The write speed setting for Cloud Volumes ONTAP: ['NORMAL','HIGH']. The default is 'NORMAL'. This argument is not relevant for HA pairs."
}

variable az_cvo_ontap_version {
    description = "The required ONTAP version. Ignored if 'use_latest_version' is set to true. The default is to use the latest version."
}

variable az_cvo_instance_type {
    description = "The type of instance to use, which depends on the license type you chose: Explore:['Standard_DS3_v2'], Standard:['Standard_DS4_v2,Standard_DS13_v2,Standard_L8s_v2'], Premium:['Standard_DS5_v2','Standard_DS14_v2'], BYOL: all instance types defined for PayGo. For more supported instance types, refer to Cloud Volumes ONTAP Release Notes. The default is 'Standard_DS4_v2' ."
}

variable az_cvo_license_type {
    description = "The type of license to be use. For single node: ['azure-cot-explore-paygo', 'azure-cot-standard-paygo', 'azure-cot-premium-paygo', 'azure-cot-premium-byol', 'capacity-paygo']. For HA: ['azure-ha-cot-standard-paygo', 'azure-ha-cot-premium-paygo', 'azure-ha-cot-premium-byol', 'ha-capacity-paygo']. The default is 'azure-cot-standard-paygo'. Use 'capacity-paygo' or 'ha-capacity-paygo' for HA on selecting Bring Your Own License type Capacity-Based or Freemium. Use 'azure-cot-premium-byol' or 'azure-ha-cot-premium-byol' for HA on selecting Bring Your Own License type Node-Based."
}

variable az_cvo_nss_account {
    description = "The NetApp Support Site account ID to use with this Cloud Volumes ONTAP system. If the license type is BYOL and an NSS account isn't provided, Cloud Manager tries to use the first existing NSS account."
}

variable "az_tenant_id" {
    description = "Tenant ID of the application/service principal registered in Azure."
}

variable "az_application_id" {
    description = "Application ID of the application/service principal registered in Azure."
}

variable "az_application_key" {
    description = "Application Key of the application/service principal registered in Azure."
}

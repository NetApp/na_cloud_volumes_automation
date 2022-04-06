variable "refresh_token" {
  description = "The refresh token from NetApp cloud manager."
  default = ""
}

variable "aws_connector_deploy_bool" {
  description = "Do you want to create a new AWS Connector?"
  default = false
  type = bool
}

variable "aws_connector_client_id" {
  description = "ID of AWS Connector instance"
  default = ""
}

variable "aws_connector_name" {
  description = "Name of the AWS Connector"
  default = ""
}

variable "aws_connector_region" {
    description = "Region for AWS Connector deployment"
    default = ""
}

variable "aws_connector_key_name" {
    description = "Key name for AWS Connector"
    default = ""
}

variable "aws_connector_company" {
  description = "Name of the org"
  default = ""
}

variable "aws_connector_instance_type" {
  description = "Instance type for AWS connector"
  default = ""
}

variable "aws_connector_subnet_id" {
  description = "Subnet ID"
  default = ""
}

variable "aws_connector_security_group_id" {
  description = "Security group ID"
  default = ""
}

variable "aws_connector_iam_instance_profile_name" {
  description = "Profile name of the IAM account for connector"
  default = ""
}

variable "aws_connector_account_id" {
  description = "Connector account ID"
  default = ""
}

variable "aws_connector_public_ip_bool" {
  description = "Do you want to link a public IP?"
  default = false
  type = bool
}

variable "cvo_name" {
  description = "Name of the CVO Instance"
  default = ""
}

variable "cvo_region" {
  description = "Region for NetApp CVO"
  default = ""
}

variable "cvo_subnet_id" {
  description = "CVO Subnet ID"
  default = ""
}

variable "cvo_vpc_id" {
  description = "CVO VPC ID"
  default = ""
}

variable "cvo_svm_password" {
  description = "CVO SVM Password"
  default = ""
}

variable "cvo_writing_speed_state" {
  description = "CVO Writing speed state"
  default = ""
}

variable "cvo_is_ha"{
  description = "Do you want to deploy CVO in HA pair?"
  default = false
  type = bool
}

variable "cvo_failover_mode" {
  description = "Failover mode for NetApp CVO"
  default = "FloatingIP"
}

variable "cvo_node1_subnet_id" {
  description = "CVO Subnet ID for node1"
  default = ""
}

variable "cvo_node2_subnet_id" {
  description = "CVO Subnet ID for node2"
  default = ""
}

variable "cvo_mediator_subnet_id" {
  description = "CVO Subnet ID for mediator"
  default = ""
}

variable "cvo_mediator_key_pair_name" {
  description = "CVO Key Pair name for mediator"
  default = ""
}

variable "cvo_cluster_floating_ip" {
  description = "CVO Cluster Floating IP"
  default = ""
}

variable "cvo_data_floating_ip" {
  description = "CVO Data Floating IP 1"
  default = ""
}

variable "cvo_data_floating_ip2" {
  description = "CVO Data Floating IP 2"
  default = ""
}

variable "cvo_svm_floating_ip" {
  description = "CVO SVM Floating IP"
  default = ""
}

variable "cvo_route_table_ids" {
  description = "CVO List of route table IDs"
  default = [""]
  type = list(string)
}

variable "cvo_license_type" {
  description = "CVO License Type"
  default = "cot-standard-paygo"
}

variable "fsx_name" {
  description = "Name of the FSX Instance"
  default = ""
}

variable "fsx_region" {
  description = "AWS Region for FSx"
  default = ""
}

variable "fsx_primary_subnet_id" {
  description = "FSx Primary Subnet ID"
  default = ""
}

variable "fsx_secondary_subnet_id" {
  description = "FSx Secondary Subnet ID"
  default = ""
}

variable "fsx_account_id" {
  description = "NetApp Cloudmanager Account ID for FSx deployment"
  default = ""
}

variable "fsx_workspace_id" {
  description = "NetApp Cloudmanager Workspace ID for FSx deployment"
  default = ""
}

variable "fsx_admin_password" {
  description = "FSx Admin Password"
  default = ""
}

variable "fsx_throughput_capacity" {
  description = "Throughput Capacity for AWS ONTAP FSx"
  default = ""
}

variable "fsx_storage_capacity_size" {
  description = "Storage Capacity Size for AWS ONTAP FSx"
  default = ""
}

variable "fsx_storage_capacity_size_unit" {
  description = "Storage Capacity Size Unit for AWS ONTAP FSx"
  default = ""
}

variable "fsx_cloudmanager_aws_credential_name" {
  description = "Netapp Cloudmanager Credential Name for FSx Deployment"
  default = ""
}


variable "az_prefix" {
  description = "The prefix used for all resources used by this NetApp Volume"
  default = ""
}
variable "az_vnet_address_space" {
  description = "The address space used by the virtual network"
  default = ""
}
variable "az_subnet_address_prefix" {
  description = "The address prefix used to create the subnet"
  default = ""
}
variable "az_volume_path" {
  description = "path used to create volume"
  default = ""
}
variable "az_capacity_pool_size" {
  description = "Enter the size in Tb for the netapp capacity pool"
  default = ""
}
variable "az_vnet_creation_bool" {
  description = "Do you want to create a new vnet?"
  type = bool
  default = false
}
variable "az_subnet_creation_bool" {
  description = "Do you want to create a new Subnet?"
  type = bool
  default = false
}
variable "az_subnet_id_for_anf_vol" {
  description = "Enter the Subnet ID needed for creating ANF volume"
  default = ""
}
variable "az_netapp_pool_service_level" {
  description = "Enter the service level for creating the netapp pool"
  default = ""
}
variable "az_netapp_vol_service_level" {
  description = "Enter the service level to be used to create the new netapp ANF volume"
  default = ""
}
variable "az_netapp_vol_protocol" {
  description = "Enter the protocol to be used for the new netapp volume"
  default = ""
}
variable "az_netapp_vol_security_style" {
  description = "Enter the Netapp volume security style"
  default = ""
}
variable "az_netapp_vol_storage_quota" {
  description = "Enter the Storage quota in GB for the new netapp volume"
  default = ""
}

variable "az_vnet_primary_address_space" {
    description = "The address space used by the primary virtual network"
    default = ""
}
variable "az_vnet_secondary_address_space" {
    description = "The address space used by the secondary virtual network"
    default = ""
}
variable "az_subnet_primary_address_prefix" {
    description = "The address prefix used to create the primary subnet"
    default = ""
}
variable "az_subnet_secondary_address_prefix" {
    description = "The address prefix used to create the secondary subnet"
    default = ""
}
variable "az_volume_path_primary" {
  description = "path used to create primary volume"
  default = ""
}
variable "az_volume_path_secondary" {
  description = "path used to create secondary volume"
  default = ""
}
variable "az_capacity_pool_size_primary" {
  description = "Enter the size in Tb for the primary netapp capacity pool"
  default = ""
}
variable "az_capacity_pool_size_secondary" {
  description = "Enter the size in Tb for the secondary netapp capacity pool"
  default = ""
}
variable "az_vnet_primary_creation_bool" {
  description = "Do you want to create a new primary vnet?"
  type = bool
  default = false
}
variable "az_vnet_secondary_creation_bool" {
  description = "Do you want to create a new secondary vnet?"
  type = bool
  default = false
}
variable "az_subnet_primary_creation_bool" {
  description = "Do you want to create a new primary Subnet?"
  type = bool
  default = false
}
variable "az_subnet_secondary_creation_bool" {
  description = "Do you want to create a new secondary Subnet?"
  type = bool
  default = false
}
variable "az_primary_subnet_id_for_anf_vol" {
  description = "Enter the primary Subnet ID needed for creating ANF volume"
  default = ""
}
variable "az_secondary_subnet_id_for_anf_vol" {
  description = "Enter the secondary Subnet ID needed for creating ANF volume"
  default = ""
}
variable "az_netapp_pool_service_level_primary" {
  description = "Enter the primary service level for creating the netapp pool"
  default = ""
}
variable "az_netapp_pool_service_level_secondary" {
  description = "Enter the secondary service level for creating the netapp pool"
  default = ""
}
variable "az_netapp_vol_service_level_primary" {
  description = "Enter the primary service level to be used to create the new netapp ANF volume"
  default = ""
}
variable "az_netapp_vol_service_level_secondary" {
  description = "Enter the secondary service level to be used to create the new netapp ANF volume"
  default = ""
}
variable "az_netapp_vol_protocol_primary" {
  description = "Enter the primary protocol to be used for the new netapp volume"
  default = ""
}
variable "az_netapp_vol_protocol_secondary" {
  description = "Enter the secondary protocol to be used for the new netapp volume"
  default = ""
}
variable "az_netapp_vol_storage_quota_primary" {
  description = "Enter the primary Storage quota in GB for the new netapp volume"
  default = ""
}
variable "az_netapp_vol_storage_quota_secondary" {
  description = "Enter the secondary Storage quota in GB for the new netapp volume"
  default = ""
}

variable "az_dp_replication_frequency" {
  description = "Enter the frequency of CRR required"
  default = ""
}
variable "az_alt_location" {
  description = "The Azure location where the secondary volume will be created."
  default = ""
}


variable az_connector_name {
    description = "The name of the Cloud Manager Connector."
    default = ""
}

variable az_connector_location {
    description = "The location where the Cloud Manager Connector will be created."
    default = ""
}

variable az_connector_subscription_id {
    description = "The ID of the Azure subscription."
    default = ""
}

variable az_connector_company {
    description = "The name of the company of the user."
    default = ""
}

variable az_connector_resource_group {
    description = "The resource group in Azure where the resources will be created."
    default = ""
}

variable az_connector_subnet_id {
    description = "The name of the subnet for the virtual machine."
    default = ""
}

variable az_connector_vnet_id {
    description = "The name of the virtual network."
    default = ""
}

variable az_connector_network_security_group_name{
    description = "The name of the security group for the instance."
    default = ""
}

variable az_connector_associate_public_ip_address{
    description = "Indicates whether to associate the public IP address to the virtual machine."
    default = ""
}

variable az_connector_account_id {
    description = "The NetApp account ID that the Connector will be associated with. If not provided, Cloud Manager uses the first account. If no account exists, Cloud Manager creates a new account. You can find the account ID in the account tab of Cloud Manager at https://cloudmanager.netapp.com."
    default = ""
}

variable az_connector_admin_password {
    description = "The password for the Connector."
    default = ""
}

variable az_connector_admin_username {
    description = "The user name for the Connector."
    default = ""
}

variable az_cvo_name {
    description = "The name of the Cloud Volumes ONTAP working environment."
    default = ""
}

variable az_cvo_location {
    description = "The location where the working environment will be created."
    default = ""
}

variable az_cvo_subnet_id {
    description = "The name of the subnet for the Cloud Volumes ONTAP system."
    default = ""
}

variable az_cvo_vnet_id {
    description = "The name of the virtual network."
    default = ""
}

variable az_cvo_vnet_resource_group {
    description = "The resource group in Azure associated to the virtual network."
    default = ""
}

variable az_cvo_data_encryption_type {
    description = "The type of encryption to use for the working environment: ['AZURE', 'NONE']. The default is 'AZURE'."
    default = ""
}

variable az_cvo_storage_type {
    description = "The type of storage for the first data aggregate: ['Premium_LRS', 'Standard_LRS', 'StandardSSD_LRS']. The default is 'Premium_LRS'"
    default = ""
}

variable az_cvo_svm_password {
    description = "The admin password for Cloud Volumes ONTAP."
    default = ""
}

variable az_cvo_workspace_id {
    description = "The ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace tab on https://cloudmanager.netapp.com."
    default = ""
}

variable az_cvo_capacity_tier {
    description = "Whether to enable data tiering for the first data aggregate: ['Blob', 'NONE']. The default is 'BLOB'."
    default = ""
}

variable az_cvo_writing_speed_state {
    description = "The write speed setting for Cloud Volumes ONTAP: ['NORMAL','HIGH']. The default is 'NORMAL'. This argument is not relevant for HA pairs."
    default = ""
}

variable az_cvo_ontap_version {
    description = "The required ONTAP version. Ignored if 'use_latest_version' is set to true. The default is to use the latest version."
    default = ""
}

variable az_cvo_instance_type {
    description = "The type of instance to use, which depends on the license type you chose: Explore:['Standard_DS3_v2'], Standard:['Standard_DS4_v2,Standard_DS13_v2,Standard_L8s_v2'], Premium:['Standard_DS5_v2','Standard_DS14_v2'], BYOL: all instance types defined for PayGo. For more supported instance types, refer to Cloud Volumes ONTAP Release Notes. The default is 'Standard_DS4_v2' ."
    default = ""
}

variable az_cvo_license_type {
    description = "The type of license to be use. For single node: ['azure-cot-explore-paygo', 'azure-cot-standard-paygo', 'azure-cot-premium-paygo', 'azure-cot-premium-byol', 'capacity-paygo']. For HA: ['azure-ha-cot-standard-paygo', 'azure-ha-cot-premium-paygo', 'azure-ha-cot-premium-byol', 'ha-capacity-paygo']. The default is 'azure-cot-standard-paygo'. Use 'capacity-paygo' or 'ha-capacity-paygo' for HA on selecting Bring Your Own License type Capacity-Based or Freemium. Use 'azure-cot-premium-byol' or 'azure-ha-cot-premium-byol' for HA on selecting Bring Your Own License type Node-Based."
    default = ""
}

variable az_cvo_nss_account {
    description = "The NetApp Support Site account ID to use with this Cloud Volumes ONTAP system. If the license type is BYOL and an NSS account isn't provided, Cloud Manager tries to use the first existing NSS account."
    default = ""
}

variable "az_tenant_id" {
    description = "Tenant ID of the application/service principal registered in Azure."
    default = ""
}

variable "az_application_id" {
    description = "Application ID of the application/service principal registered in Azure."
    default = ""
}

variable "az_application_key" {
    description = "Application Key of the application/service principal registered in Azure."
    default = ""
}

variable "az_location" {
  description = "Azure Region"
  default = ""
}


variable "az_netapp_vol_protocol1" {
  description = "Enter the first protocol to be used for the new netapp volume"
  default = ""
}

variable "az_netapp_vol_protocol2" {
  description = "Enter the second protocol to be used for the new netapp volume"
  default = ""
}


variable "az_smb_server_username" {
  description = "Username to create ActiveDirectory object"
  default = ""
}

variable "az_smb_server_password" {
  description = "User password to create ActiveDirectory object"
  default = ""
}

variable "az_smb_server_name" {
  description = "Server Name to create ActiveDirectory object."
  default = ""
}

variable "az_smb_dns_servers" {
  description = "DNS Server IP to create ActiveDirectory object."
  default = ""
}

variable "az_snapshot_id" {
  description = "Snapshot ID using which new ANF volume will be created."
  default = ""
}

variable "gcp_connector_deploy_bool" {
  description = "Do you want to create a new GCP Connector?"
  type = bool
  default = true
}

variable "gcp_connector_client_id" {
  description = "ID of GCP Connector instance"
  default = ""
}

variable "gcp_connector_name" {
  description = "Name of the GCP Connector"
  default = ""
}

variable "gcp_connector_project_id" {
    description = "Project ID for GCP Connector deployment"
    default = ""
}

variable "gcp_connector_zone" {
    description = "Zone for GCP Connector"
    default = ""
}

variable "gcp_connector_company" {
  description = "Name of the org"
  default = ""
}

variable "gcp_connector_instance_type" {
  description = "Instance type for gcp connector"
  default = ""
}

variable "gcp_connector_service_account_email" {
  description = "Service Account E-Mail"
  default = ""
}

variable "gcp_connector_service_account_path" {
  description = "Path to the JSON GCP Key"
  default = ""
}

variable "gcp_connector_account_id" {
  description = "Connector account ID"
  default = ""
}

variable "gcp_cvo_is_ha"{
  description = "Do you want to deploy CVO in HA pair?"
  type = bool
  default = false
}

variable "gcp_cvo_name" {
  description = "Name of the CVO Instance"
  default = ""
}

variable "gcp_cvo_project_id" {
    description = "Project ID for GCP CVO deployment"
    default = ""
}

variable "gcp_cvo_zone" {
  description = "Zone for NetApp CVO"
  default = ""
}

variable "gcp_cvo_node1_zone" {
  description = "Zone for NetApp CVO Node 1"
  default = ""
}

variable "gcp_cvo_node2_zone" {
  description = "Zone for NetApp CVO Zone 2"
  default = ""
}

variable "gcp_cvo_mediator_zone" {
  description = "Zone for NetApp CVO Mediator"
  default = ""
}

variable "gcp_cvo_subnet_id" {
  description = "CVO Subnet ID for CVO"
  default = ""
}

variable "gcp_cvo_subnet0_node_and_data_connectivity" {
  description = "CVO Subnet ID for node1"
  default = ""
}

variable "gcp_cvo_subnet1_cluster_connectivity" {
  description = "CVO Subnet ID for node2"
  default = ""
}

variable "gcp_cvo_subnet2_ha_connectivity" {
  description = "CVO Subnet ID for node3"
  default = ""
}

variable "gcp_cvo_subnet3_data_replication" {
  description = "CVO Subnet ID for node4"
  default = ""
}

variable "gcp_cvo_vpc_id" {
  description = "CVO VPC ID"
  default = ""
}

variable "gcp_cvo_vpc0_node_and_data_connectivity" {
  description = "CVO VPC ID node1"
  default = ""
}

variable "gcp_cvo_vpc1_cluster_connectivity" {
  description = "CVO VPC ID node2"
  default = ""
}

variable "gcp_cvo_vpc2_ha_connectivity" {
  description = "CVO VPC ID node3"
  default = ""
}

variable "gcp_cvo_vpc3_data_replication" {
  description = "CVO VPC ID node4"
  default = ""
}

variable "gcp_cvo_gcp_service_account" {
  description = "Service Account E-Mail"
  default = ""
}

variable "gcp_cvo_svm_password" {
  description = "CVO SVM Password"
  default = ""
}

variable "gcp_cvo_workspace_id" {
  description = "CVO Cloud Manager Workspace ID"
  default = ""
}

variable "gcp_cvo_license_type" {
  description = "CVO License Type"
  default = ""
}

variable "gcp_cvo_capacity_package_name" {
  description = "CVO Capacity Package Name"
  default = ""
}

variable "gcp_cvo_gcp_volume_size" {
  description = "CVO Volume Size"
  default = ""
}

variable "gcp_cvo_gcp_volume_size_unit" {
  description = "CVO Volume Size Unit"
  default = ""
}


variable "gcp_cvs_gcp_service_account_path" {
  description = "Path to the JSON GCP Key"
  default = ""
}

variable "gcp_cvs_region" {
  description = "GCP Region for CVS volume"
  default = ""
}

variable "gcp_cvs_name" {
  description = "Name of the CVS Instance"
  default = ""
}

variable "gcp_cvs_project_id" {
    description = "Project ID for GCP CVS deployment"
    default = ""
}

variable "gcp_cvs_network" {
  description = "GCP VPC Network Name"
  default = ""
}

variable "gcp_cvs_size" {
  description = "CVS Volume Size in GB"
  default = ""
}

variable "gcp_cvs_volume_path" {
  description = "Volume Path"
  default = ""
}

variable "gcp_cvs_protocol_types" {
  description = "Protocol Type For NFS use 'NFSv3' or 'NFSv4' and for SMB use 'CIFS' or 'SMB'"
  default = ""
}

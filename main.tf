module "anf" {
    source = ".//azure/anf"

    #anf volume details
    az_location = var.az_location
    az_prefix = var.az_prefix
    az_vnet_address_space = var.az_vnet_address_space
    az_subnet_address_prefix = var.az_subnet_address_prefix
    az_volume_path = var.az_volume_path
    az_capacity_pool_size = var.az_capacity_pool_size
    az_vnet_creation_bool = var.az_vnet_creation_bool
    az_subnet_creation_bool = var.az_subnet_creation_bool
    az_subnet_id_for_anf_vol = var.az_subnet_id_for_anf_vol
    az_netapp_pool_service_level = var.az_netapp_pool_service_level
    az_netapp_vol_service_level = var.az_netapp_vol_service_level
    az_netapp_vol_protocol = var.az_netapp_vol_protocol
    az_netapp_vol_security_style = var.az_netapp_vol_security_style
    az_netapp_vol_storage_quota = var.az_netapp_vol_storage_quota
}

module "anf_data_protection" {
    source = ".//azure/anf_data_protection"

    #general volume details
    az_prefix = var.az_prefix
    az_dp_replication_frequency = var.az_dp_replication_frequency


    #primary volume details
    az_location = var.az_location
    az_vnet_primary_address_space = var.az_vnet_primary_address_space
    az_subnet_primary_address_prefix = var.az_subnet_primary_address_prefix
    az_volume_path_primary = var.az_volume_path_primary
    az_capacity_pool_size_primary = var.az_capacity_pool_size_primary
    az_vnet_primary_creation_bool = var.az_vnet_primary_creation_bool
    az_subnet_primary_creation_bool = var.az_subnet_primary_creation_bool
    az_primary_subnet_id_for_anf_vol = var.az_primary_subnet_id_for_anf_vol
    az_netapp_pool_service_level_primary = var.az_netapp_pool_service_level_primary
    az_netapp_vol_service_level_primary = var.az_netapp_vol_service_level_primary
    az_netapp_vol_protocol_primary = var.az_netapp_vol_protocol_primary
    az_netapp_vol_storage_quota_primary = var.az_netapp_vol_storage_quota_primary

    #secondary volume details
    az_alt_location = var.az_alt_location
    az_vnet_secondary_address_space = var.az_vnet_secondary_address_space
    az_subnet_secondary_address_prefix = var.az_subnet_secondary_address_prefix
    az_volume_path_secondary = var.az_volume_path_secondary
    az_capacity_pool_size_secondary = var.az_capacity_pool_size_secondary
    az_vnet_secondary_creation_bool = var.az_vnet_secondary_creation_bool
    az_subnet_secondary_creation_bool = var.az_subnet_secondary_creation_bool
    az_secondary_subnet_id_for_anf_vol = var.az_secondary_subnet_id_for_anf_vol
    az_netapp_pool_service_level_secondary = var.az_netapp_pool_service_level_secondary
    az_netapp_vol_service_level_secondary = var.az_netapp_vol_service_level_secondary
    az_netapp_vol_protocol_secondary = var.az_netapp_vol_protocol_secondary
    az_netapp_vol_storage_quota_secondary = var.az_netapp_vol_storage_quota_secondary

}

module "anf_dual_protocol" {
    source = ".//azure/anf_dual_protocol"

    #anf volume details
    az_location = var.az_location
    az_prefix = var.az_prefix
    az_vnet_address_space = var.az_vnet_address_space
    az_subnet_address_prefix = var.az_subnet_address_prefix
    az_volume_path = var.az_volume_path
    az_capacity_pool_size = var.az_capacity_pool_size
    az_vnet_creation_bool = var.az_vnet_creation_bool
    az_subnet_creation_bool = var.az_subnet_creation_bool
    az_subnet_id_for_anf_vol = var.az_subnet_id_for_anf_vol
    az_netapp_pool_service_level = var.az_netapp_pool_service_level
    az_netapp_vol_service_level = var.az_netapp_vol_service_level
    az_netapp_vol_protocol1 = var.az_netapp_vol_protocol1
    az_netapp_vol_protocol2 = var.az_netapp_vol_protocol2
    az_netapp_vol_storage_quota = var.az_netapp_vol_storage_quota

    #smb server details
    az_smb_server_username = var.az_smb_server_username
    az_smb_server_password = var.az_smb_server_password
    az_smb_server_name = var.az_smb_server_name
    az_smb_dns_servers = var.az_smb_dns_servers
}

module "anf_volume_from_snapshot" {
    source = ".//azure/anf_volume_from_snapshot"

    #anf volume details
    az_location = var.az_location
    az_prefix = var.az_prefix
    az_vnet_address_space = var.az_vnet_address_space
    az_subnet_address_prefix = var.az_subnet_address_prefix
    az_volume_path = var.az_volume_path
    az_capacity_pool_size = var.az_capacity_pool_size
    az_vnet_creation_bool = var.az_vnet_creation_bool
    az_subnet_creation_bool = var.az_subnet_creation_bool
    az_subnet_id_for_anf_vol = var.az_subnet_id_for_anf_vol
    az_netapp_pool_service_level = var.az_netapp_pool_service_level
    az_netapp_vol_service_level = var.az_netapp_vol_service_level
    az_netapp_vol_protocol = var.az_netapp_vol_protocol
    az_netapp_vol_storage_quota = var.az_netapp_vol_storage_quota
    az_snapshot_id = var.az_snapshot_id
}


module "az_cvo_single_node_deployment" {
    source = ".//azure/cvo_single_node_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    az_connector_name = var.az_connector_name
    az_connector_location = var.az_connector_location
    az_connector_subscription_id = var.az_connector_subscription_id
    az_connector_company = var.az_connector_company
    az_connector_resource_group = var.az_connector_resource_group
    az_connector_subnet_id = var.az_connector_subnet_id
    az_connector_vnet_id = var.az_connector_vnet_id
    az_connector_network_security_group_name = var.az_connector_network_security_group_name
    az_connector_associate_public_ip_address = var.az_connector_associate_public_ip_address
    az_connector_account_id = var.az_connector_account_id
    az_connector_admin_password = var.az_connector_admin_password
    az_connector_admin_username = var.az_connector_admin_username

    #azure service principal credentials
    az_tenant_id = var.az_tenant_id
    az_application_id = var.az_application_id
    az_application_key = var.az_application_key

    #cvo details
    az_cvo_name = var.az_cvo_name
    az_cvo_location = var.az_cvo_location
    az_cvo_subnet_id = var.az_cvo_subnet_id
    az_cvo_vnet_id = var.az_cvo_vnet_id
    az_cvo_vnet_resource_group = var.az_cvo_vnet_resource_group
    az_cvo_data_encryption_type = var.az_cvo_data_encryption_type
    az_cvo_storage_type = var.az_cvo_storage_type
    az_cvo_svm_password = var.az_cvo_svm_password
    az_cvo_workspace_id = var.az_cvo_workspace_id
    az_cvo_capacity_tier = var.az_cvo_capacity_tier
    az_cvo_writing_speed_state = var.az_cvo_writing_speed_state
    az_cvo_ontap_version = var.az_cvo_ontap_version
    az_cvo_instance_type = var.az_cvo_instance_type
    az_cvo_license_type = var.az_cvo_license_type
    az_cvo_nss_account = var.az_cvo_nss_account
}

module "az_cvo_ha_deployment" {
    source = ".//azure/cvo_ha_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    az_connector_name = var.az_connector_name
    az_connector_location = var.az_connector_location
    az_connector_subscription_id = var.az_connector_subscription_id
    az_connector_company = var.az_connector_company
    az_connector_resource_group = var.az_connector_resource_group
    az_connector_subnet_id = var.az_connector_subnet_id
    az_connector_vnet_id = var.az_connector_vnet_id
    az_connector_network_security_group_name = var.az_connector_network_security_group_name
    az_connector_associate_public_ip_address = var.az_connector_associate_public_ip_address
    az_connector_account_id = var.az_connector_account_id
    az_connector_admin_password = var.az_connector_admin_password
    az_connector_admin_username = var.az_connector_admin_username

    #azure service principal credentials
    az_tenant_id = var.az_tenant_id
    az_application_id = var.az_application_id
    az_application_key = var.az_application_key

    #cvo details
    az_cvo_name = var.az_cvo_name
    az_cvo_location = var.az_cvo_location
    az_cvo_subnet_id = var.az_cvo_subnet_id
    az_cvo_vnet_id = var.az_cvo_vnet_id
    az_cvo_vnet_resource_group = var.az_cvo_vnet_resource_group
    az_cvo_data_encryption_type = var.az_cvo_data_encryption_type
    az_cvo_storage_type = var.az_cvo_storage_type
    az_cvo_svm_password = var.az_cvo_svm_password
    az_cvo_workspace_id = var.az_cvo_workspace_id
    az_cvo_capacity_tier = var.az_cvo_capacity_tier
    az_cvo_writing_speed_state = var.az_cvo_writing_speed_state
    az_cvo_ontap_version = var.az_cvo_ontap_version
    az_cvo_instance_type = var.az_cvo_instance_type
    az_cvo_license_type = var.az_cvo_license_type
    az_cvo_nss_account = var.az_cvo_nss_account
}


module "aws_sn" {
    source = ".//aws/cvo_single_node_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    aws_connector_deploy_bool = var.aws_connector_deploy_bool

    #if aws_connector_deploy_bool is set to false
    aws_connector_client_id = var.aws_connector_client_id

    #if aws_connector_deploy_bool is set to true
    aws_connector_name = var.aws_connector_name
    aws_connector_region = var.aws_connector_region
    aws_connector_key_name = var.aws_connector_key_name
    aws_connector_company = var.aws_connector_company
    aws_connector_instance_type = var.aws_connector_instance_type
    aws_connector_subnet_id = var.aws_connector_subnet_id
    aws_connector_security_group_id = var.aws_connector_security_group_id
    aws_connector_iam_instance_profile_name = var.aws_connector_iam_instance_profile_name
    aws_connector_account_id = var.aws_connector_account_id
    aws_connector_public_ip_bool = var.aws_connector_public_ip_bool

    #cvo details
    cvo_name = var.cvo_name
    cvo_region = var.cvo_region
    cvo_subnet_id = var.cvo_subnet_id
    cvo_vpc_id = var.cvo_vpc_id
    cvo_svm_password = var.cvo_svm_password
    cvo_writing_speed_state = var.cvo_writing_speed_state

}

module "aws_ha" {
    source = ".//aws/cvo_ha_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    aws_connector_deploy_bool = var.aws_connector_deploy_bool

    #if aws_connector_deploy_bool is set to false
    aws_connector_client_id = var.aws_connector_client_id

    #if aws_connector_deploy_bool is set to true
    aws_connector_name = var.aws_connector_name
    aws_connector_region = var.aws_connector_region
    aws_connector_key_name = var.aws_connector_key_name
    aws_connector_company = var.aws_connector_company
    aws_connector_instance_type = var.aws_connector_instance_type
    aws_connector_subnet_id = var.aws_connector_subnet_id
    aws_connector_security_group_id = var.aws_connector_security_group_id
    aws_connector_iam_instance_profile_name = var.aws_connector_iam_instance_profile_name
    aws_connector_account_id = var.aws_connector_account_id
    aws_connector_public_ip_bool = var.aws_connector_public_ip_bool

    #cvo details
    cvo_name = var.cvo_name
    cvo_region = var.cvo_region
    cvo_is_ha = var.cvo_is_ha
    cvo_failover_mode = var.cvo_failover_mode
    cvo_node1_subnet_id = var.cvo_node1_subnet_id
    cvo_node2_subnet_id = var.cvo_node2_subnet_id
    cvo_mediator_subnet_id = var.cvo_mediator_subnet_id
    cvo_mediator_key_pair_name = var.cvo_mediator_key_pair_name
    cvo_cluster_floating_ip = var.cvo_cluster_floating_ip
    cvo_data_floating_ip = var.cvo_data_floating_ip
    cvo_data_floating_ip2 = var.cvo_data_floating_ip2
    cvo_svm_floating_ip = var.cvo_svm_floating_ip
    cvo_route_table_ids = var.cvo_route_table_ids
    cvo_vpc_id = var.cvo_vpc_id
    cvo_svm_password = var.cvo_svm_password
    cvo_license_type = var.cvo_license_type

}

module "aws_fsx" {
    source = ".//aws/fsx_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    aws_connector_deploy_bool = var.aws_connector_deploy_bool

    #if aws_connector_deploy_bool is set to true
    aws_connector_name = var.aws_connector_name
    aws_connector_region = var.aws_connector_region
    aws_connector_key_name = var.aws_connector_key_name
    aws_connector_company = var.aws_connector_company
    aws_connector_instance_type = var.aws_connector_instance_type
    aws_connector_subnet_id = var.aws_connector_subnet_id
    aws_connector_security_group_id = var.aws_connector_security_group_id
    aws_connector_iam_instance_profile_name = var.aws_connector_iam_instance_profile_name
    aws_connector_account_id = var.aws_connector_account_id
    aws_connector_public_ip_bool = var.aws_connector_public_ip_bool

    #fsx details
    fsx_name = var.fsx_name
    fsx_region = var.fsx_region
    fsx_primary_subnet_id = var.fsx_primary_subnet_id
    fsx_secondary_subnet_id = var.fsx_secondary_subnet_id
    fsx_account_id = var.fsx_account_id
    fsx_workspace_id = var.fsx_workspace_id
    fsx_admin_password = var.fsx_admin_password
    fsx_throughput_capacity = var.fsx_throughput_capacity
    fsx_storage_capacity_size = var.fsx_storage_capacity_size
    fsx_storage_capacity_size_unit = var.fsx_storage_capacity_size_unit
    fsx_cloudmanager_aws_credential_name = var.fsx_cloudmanager_aws_credential_name

}


module "gcp_single_node" {
    source = ".//gcp/cvo_single_node_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    gcp_connector_deploy_bool = var.gcp_connector_deploy_bool

    #if aws_connector_deploy_bool is set to false
    gcp_connector_client_id = var.gcp_connector_client_id

    #if aws_connector_deploy_bool is set to true
    gcp_connector_name = var.gcp_connector_name
    gcp_connector_project_id = var.gcp_connector_project_id
    gcp_connector_zone = var.gcp_connector_zone
    gcp_connector_company = var.gcp_connector_company
    gcp_connector_service_account_email = var.gcp_connector_service_account_email
    gcp_connector_service_account_path = var.gcp_connector_service_account_path
    gcp_connector_account_id = var.gcp_connector_account_id

    #cvo details
    gcp_cvo_name = var.gcp_cvo_name
    gcp_cvo_project_id = var.gcp_cvo_project_id
    gcp_cvo_zone = var.gcp_cvo_zone
    gcp_cvo_gcp_service_account = var.gcp_cvo_gcp_service_account
    gcp_cvo_svm_password = var.gcp_cvo_svm_password
    gcp_cvo_workspace_id = var.gcp_cvo_workspace_id
    gcp_cvo_license_type = var.gcp_cvo_license_type
    gcp_cvo_capacity_package_name = var.gcp_cvo_capacity_package_name

}

module "gcp_ha" {
    source = ".//gcp/cvo_ha_deployment"

    #refresh token
    refresh_token = var.refresh_token

    #connector details
    gcp_connector_deploy_bool = var.gcp_connector_deploy_bool

    #if aws_connector_deploy_bool is set to false
    gcp_connector_client_id = var.gcp_connector_client_id

    #if aws_connector_deploy_bool is set to true
    gcp_connector_name = var.gcp_connector_name
    gcp_connector_project_id = var.gcp_connector_project_id
    gcp_connector_zone = var.gcp_connector_zone
    gcp_connector_company = var.gcp_connector_company
    gcp_connector_service_account_email = var.gcp_connector_service_account_email
    gcp_connector_service_account_path = var.gcp_connector_service_account_path
    gcp_connector_account_id = var.gcp_connector_account_id

    #cvo details
    gcp_cvo_is_ha = var.gcp_cvo_is_ha
    gcp_cvo_name = var.gcp_cvo_name
    gcp_cvo_project_id = var.gcp_cvo_project_id
    gcp_cvo_zone = var.gcp_cvo_zone
    gcp_cvo_node1_zone = var.gcp_cvo_node1_zone
    gcp_cvo_node2_zone = var.gcp_cvo_node2_zone
    gcp_cvo_mediator_zone = var.gcp_cvo_mediator_zone
    gcp_cvo_vpc_id = var.gcp_cvo_vpc_id
    gcp_cvo_subnet_id = var.gcp_cvo_subnet_id
    gcp_cvo_vpc0_node_and_data_connectivity = var.gcp_cvo_vpc0_node_and_data_connectivity
    gcp_cvo_vpc1_cluster_connectivity = var.gcp_cvo_vpc1_cluster_connectivity
    gcp_cvo_vpc2_ha_connectivity = var.gcp_cvo_vpc2_ha_connectivity
    gcp_cvo_vpc3_data_replication = var.gcp_cvo_vpc3_data_replication
    gcp_cvo_subnet0_node_and_data_connectivity = var.gcp_cvo_subnet0_node_and_data_connectivity
    gcp_cvo_subnet1_cluster_connectivity = var.gcp_cvo_subnet1_cluster_connectivity
    gcp_cvo_subnet2_ha_connectivity = var.gcp_cvo_subnet2_ha_connectivity
    gcp_cvo_subnet3_data_replication = var.gcp_cvo_subnet3_data_replication
    gcp_cvo_gcp_service_account = var.gcp_cvo_gcp_service_account
    gcp_cvo_svm_password = var.gcp_cvo_svm_password
    gcp_cvo_workspace_id = var.gcp_cvo_workspace_id
    gcp_cvo_license_type = var.gcp_cvo_license_type
    gcp_cvo_capacity_package_name = var.gcp_cvo_capacity_package_name
    gcp_cvo_gcp_volume_size = var.gcp_cvo_gcp_volume_size
    gcp_cvo_gcp_volume_size_unit = var.gcp_cvo_gcp_volume_size_unit

}

module "gcp_cvs_volume" {

}

terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = "21.11.0"
    }
  }
}

provider "netapp-cloudmanager" {
  refresh_token = var.refresh_token
}

resource "netapp-cloudmanager_connector_azure" "cl-occm-azure" {
  provider = netapp-cloudmanager
  name = var.az_connector_name
  location = var.az_connector_location
  subscription_id = var.az_connector_subscription_id
  company = var.az_connector_company
  resource_group = var.az_connector_resource_group
  subnet_id = var.az_connector_subnet_id
  vnet_id = var.az_connector_vnet_id
  network_security_group_name = var.az_connector_network_security_group_name
  associate_public_ip_address = var.az_connector_associate_public_ip_address
  account_id = var.az_connector_account_id
  admin_password = var.az_connector_admin_password
  admin_username = var.az_connector_admin_username
}

resource "null_resource" "azure-creds" {
  depends_on = [netapp-cloudmanager_connector_azure.cl-occm-azure]
  provisioner "local-exec" {
      command = <<EOT
       str=`az rest -m get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/${var.az_connector_subscription_id}/resourceGroups/${var.az_connector_resource_group}/providers/Microsoft.Compute/virtualMachines/${var.az_connector_name}?api-version=2021-11-01' | jq -r .properties.networkProfile.networkInterfaces | jq -r '.[].id'`
       networkInterfaceName=`basename $str`
       ip=`az rest -m get --header "Accept=application/json" -u "https://management.azure.com/subscriptions/${var.az_connector_subscription_id}/resourceGroups/${var.az_connector_resource_group}/providers/Microsoft.Network/networkInterfaces/$networkInterfaceName/ipConfigurations?api-version=2021-03-01" | jq -r '.value' | jq -r '.[].properties.privateIPAddress'`
       curl https://netapp-cloud-account.auth0.com/oauth/token -X POST --header "Content-Type: application/json" --data "{ \"grant_type\": \"refresh_token\", \"refresh_token\": \"${var.refresh_token}\", \"client_id\": \"Mu0V1ywgYteI6w1MbD15fKfVIUrNXGWC\" }" | jq -r .access_token > token.txt
       token=`cat token.txt`
       curl -X POST http://$ip/occm/api/accounts/azure --header "Authorization: $token" --header "Content-Type: application/json" --data "{\"accountName\": \"${var.az_connector_name}\", \"providerKeys\": {\"tenantId\": \"${var.az_tenant_id}\",\"applicationId\": \"${var.az_application_id}\",\"applicationKey\": \"${var.az_application_key}\"}}"
EOT
  }
}

resource "netapp-cloudmanager_cvo_azure" "cl-azure" {
  depends_on = [null_resource.azure-creds]
  provider = netapp-cloudmanager
  name = var.az_cvo_name
  location = var.az_cvo_location
  subscription_id = var.az_connector_subscription_id
  subnet_id = var.az_cvo_subnet_id
  vnet_id = var.az_cvo_vnet_id
  vnet_resource_group = var.az_cvo_vnet_resource_group
  data_encryption_type = var.az_cvo_data_encryption_type
  storage_type = var.az_cvo_storage_type
  svm_password = var.az_cvo_svm_password
  client_id = netapp-cloudmanager_connector_azure.cl-occm-azure.client_id
  workspace_id = var.az_cvo_workspace_id
  capacity_tier = var.az_cvo_capacity_tier
  writing_speed_state = var.az_cvo_writing_speed_state
  is_ha = false
  ontap_version = var.az_cvo_ontap_version
  instance_type = var.az_cvo_instance_type
  license_type = var.az_cvo_license_type
  nss_account = var.az_cvo_nss_account
}

### AWS ###

aws_profile   = "AWS_PROFILE"  #_!!! CHANGE ME !!!_#
aws_uk_region = "eu-west-2"
aws_eu_region = "eu-west-1"

### Aviatrix Controller ###

ctrl_username         = "admin"
ctrl_password         = "CONTROLLER_PASSWORD" #_!!! CHANGE ME !!!_#
ctrl_ip               = "CONTROLLER_IP" #_!!! CHANGE ME !!!_#
aws_ctrl_account_name = "avtx_aws_account"

### Aviatrix Edge 2.0 ###

side_id                                 = "esx67"
edge_gw_name                            = "AVTRX-EDGE2-ESX-GW01"
lan_interface_prefix                    = "192.168.10.2/24"      # Assigned to Edge
wan_default_gateway_ip                  = "192.168.200.254"      # Assigned to upstream gateway
wan_interface_ip_prefix                 = "192.168.200.253/30"   # Assigned to Edge
wan_public_ip                           = "90.206.40.249"
primary_dns_server_ip                   = "192.168.2.254"      # Forward to upstream gateway
secondary_dns_server_ip                 = "8.8.8.8"
management_default_gateway_ip           = "192.168.2.254"
management_egress_ip_prefix             = "90.206.40.249/32"
management_interface_config             = "Static"
management_interface_ip_prefix          = "192.168.2.40/24"
edge_local_as_number                    = "64513"
transit_gws_enable_over_private_network = false
enable_transitive_routing               = false
ztp_file_type                           = "iso"
avx_aws_transit                         = "avx-aws-uk-transit-gw"
#avx_aws_transit_attached                = true # uncomment it when Edge gateway will be deployed



### VMware VSphere ###

vsphere_provider_user         = "administrator@vdevnetpro.com"
vsphere_provider_password     = "vCENTER_PASSWORD"    #_!!! CHANGE ME !!!_#
vsphere_provider_vcenter      = "vcenter7srv01.vdevnetpro.com"
allow_unverified_ssl          = true
vsphere_datacenter            = "vDEVNETPRO-DC"
vsphere_datastore             = "ESX67_SRV01_SSD_LOCAL"
vsphere_resource_pool         = "AVIATRIX_RP"  # Must be created on vCenter
vsphere_network_avtrx_lan     = "pg_avtrx_net10_lan"
vsphere_network_avtrx_wan     = "pg_avtrx_net200_wan"
vsphere_network_mgmt_internal = "pg_mgmt_external"
vsphere_host                  = "esx67srv01.vdevnetpro.com"
vsphere_ovf_vm_template_name  = "edge_ova_template"
disk_provisioning             = "thin"
instance_count                = "1"
remote_ovf_url                = "https://pubstorage8899.s3.eu-west-2.amazonaws.com/avx-edge-gateway-vmware-2022-10-26.ova"
local_ovf_path                = ""
cdrom_iso_path                = "ISO/edge_config_ready_to_deploy.iso"
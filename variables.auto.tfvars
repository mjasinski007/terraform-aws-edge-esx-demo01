## AWS Provider
aws_profile   = "169444603265"
aws_uk_region = "eu-west-2"
aws_eu_region = "eu-west-1"

ctrl_username         = "admin"
ctrl_password         = "Its@secret!23"
ctrl_ip               = "3.10.92.20"
aws_ctrl_account_name = "avtx_aws_account"

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
enable_edge_transitive_routing          = false
ztp_file_type                           = "iso"
avx_aws_transit                         = "avx-aws-uk-transit-gw"
#avx_aws_transit_attached                = true # uncomment it when Edge gateway will be deployed


vsphere_datacenter            = "vDEVNETPRO-DC"
vsphere_datastore             = "ESX67_SRV01_SSD_LOCAL"
vsphere_resource_pool         = "AVIATRIX_RP"
vsphere_network_avtrx_lan     = "pg_avtrx_net10_lan"
vsphere_network_avtrx_wan     = "pg_avtrx_net200_wan"
vsphere_network_mgmt_internal = "pg_mgmt_external"
vsphere_host                  = "192.168.2.106"
vsphere_ovf_vm_template_name  = "edge_ova_template"
disk_provisioning             = "thin"
instance_count                = "1"

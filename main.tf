module "edge_esx_gw01" {
    source  = "terraform-aviatrix-modules/mc-edge/aviatrix"
    version = "1.2.0"

    site_id = var.side_id

    edge_gws = {
        gw1 = {
            gw_name                        = var.edge_gw_name
            lan_interface_ip_prefix        = var.lan_interface_prefix
            wan_default_gateway_ip         = var.wan_default_gateway_ip
            wan_interface_ip_prefix        = var.wan_interface_ip_prefix
            #wan_public_ip                  = var.wan_public_ip
            dns_server_ip                  = var.primary_dns_server_ip
            secondary_dns_server_ip        = var.secondary_dns_server_ip
            enable_edge_transitive_routing = false
            management_default_gateway_ip  = var.management_default_gateway_ip
            management_egress_ip_prefix    = var.management_egress_ip_prefix
            management_interface_config    = var.management_interface_config
            management_interface_ip_prefix = var.management_interface_ip_prefix
            local_as_number                = var.edge_local_as_number
            ztp_file_download_path         = "${path.module}"
            ztp_file_type                  = var.ztp_file_type

            transit_gws = {
                transit1 = {
                    name = var.avx_aws_transit
                    #attached = var.avx_aws_transit_attached
                },
            }
        }
    }
}
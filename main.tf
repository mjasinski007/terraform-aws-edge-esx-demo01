/* 
##########################################
### Create New Transit VPC and Gateway ###
##########################################

module "aws_transit" {
    source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
    version = "2.2.1"

    cloud                         = "aws"
    account                       = var.aws_ctrl_account_name
    region                        = var.aws_uk_region
    name                          = var.avx_aws_uk_transit_vpc_name
    gw_name                       = var.avx_aws_uk_transit_gw_name
    ha_gw                         = true
    instance_size                 = var.avx_aws_uk_transit_gw_instance_size
    cidr                          = var.avx_aws_uk_transit_vpc_cidr
    connected_transit             = false
    enable_firenet                = false
    enable_transit_firenet        = false
    enable_multi_tier_transit     = false
    enable_egress_transit_firenet = false

    tags = merge(
        local.default_tags,
        {
            DESCRIPTION = "Aviatrix Transt VPC and Gateway in AWS UK Env"
        }
    )
}

########################################
### Create New Spoke VPC and Gateway ###
########################################

module "aws_uk_spoke_prod" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version = "1.3.2"

    cloud           = "AWS"
    account         = var.aws_ctrl_account_name
    region          = var.aws_uk_region
    name            = var.avx_aws_uk_spoke_prod_gw_name
    ha_gw           = true
    instance_size   = var.avx_aws_uk_spoke_prod_gw_instance_size
    cidr            = var.avx_aws_uk_spoke_prod_vpc_cidr
    transit_gw      = var.avx_aws_uk_transit_gw_name
    attached        = true
    #security_domain = "blue"
    transit_gw_route_tables = ["rtb-0cf1cc449ef335693","rtb-00bf68e4e8a365e84", "rtb-06f0da9f905daf55f"]

    tags = merge(
        local.default_tags,
        {
            DESCRIPTION = "Aviatrix PROD VPC and Spoke 1 Gateway in AWS UK Env"
        }
    )
    depends_on = [module.aws_transit]
} */


####################################################
### Create On-Prem ESX Aviatrix Edge 2.x Gateway ###
####################################################

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
## AWS Provider
aws_profile   = "169444603265"
aws_uk_region = "eu-west-2"
aws_eu_region = "eu-west-1"

ctrl_username         = "admin"
ctrl_password         = "Its@secret!23"
ctrl_ip               = "3.10.92.20"
aws_ctrl_account_name = "avtx_aws_account"

side_id                        = "avxEdgeESX7GW01"
edge_gw_name                   = "avx-edge-esx7-gw01"
lan_interface_prefix           = "192.168.10.2/24"
wan_default_gateway_ip         = "192.168.200.1"
wan_interface_ip_prefix        = "192.168.200.0/30"
#wan_public_ip                  = ""
primary_dns_server_ip          = "192.168.2.254"
secondary_dns_server_ip        = "8.8.8.8"
enable_edge_transitive_routing = false
management_default_gateway_ip  = "192.168.2.254"
management_egress_ip_prefix    = "145.40.134.209/32"
management_interface_config    = "Static"
management_interface_ip_prefix = "192.168.2.156/24"
edge_local_as_number           = "655513"
ztp_file_type                  = "iso"
avx_aws_transit                = "null"
avx_aws_transit_attached       = false

avx_aws_uk_transit_gw_name             = "avx-aws-uk-transit-gw"
avx_aws_uk_transit_gw_instance_size    = "t3.medium"
avx_aws_uk_transit_vpc_cidr            = "10.100.0.0/16"
avx_aws_uk_transit_vpc_name            = "avx-aws-uk-transit-vpc"

avx_aws_uk_spoke_prod_gw_name          = "avx-aws-uk-prod-spk-gw"
avx_aws_uk_spoke_prod_gw_instance_size = "t3.medium"
avx_aws_uk_spoke_prod_vpc_cidr         = "10.10.0.0/16"
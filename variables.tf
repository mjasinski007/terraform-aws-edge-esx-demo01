### Aviatrix Controller Variables ###
variable "ctrl_username" {
    type = string
}

variable "ctrl_password" {
    type = string
}

variable "ctrl_ip" {
    type = string
}

variable "aws_ctrl_account_name" {
    type = string
}

variable "aws_profile" {
    type = string
}

variable "aws_uk_region" {
    type = string
}

variable "aws_eu_region" {
    type = string
}

variable "side_id" {
    type = string
}

variable "edge_gw_name" {
    type = string
}

variable "lan_interface_prefix" {
    type = string
}

variable "wan_default_gateway_ip" {
    type = string
}

variable "wan_interface_ip_prefix" {
    type = string
}

/* variable "wan_public_ip" {
    type = string
} */

variable "primary_dns_server_ip" {
    type = string
}

variable "secondary_dns_server_ip" {
    type = string
}

variable "enable_edge_transitive_routing" {
    type = bool
}

variable "management_default_gateway_ip" {
    type = string
}

variable "management_egress_ip_prefix" {
    type = string
}

variable "management_interface_config" {
    type = string
}

variable "management_interface_ip_prefix" {
    type = string
}

variable "avx_aws_transit" {
    type = string
}

variable "avx_aws_transit_attached" {
    type    = bool
    default = false
}

variable "edge_local_as_number" {
    type = string
}

variable "ztp_file_type" {
    type = string
}

variable "avx_aws_uk_transit_gw_name" {
    type = string
}

variable "avx_aws_uk_transit_gw_instance_size" {
    type = string
}

variable "avx_aws_uk_transit_vpc_cidr" {
    type = string
}

variable "avx_aws_uk_transit_vpc_name" {
    type = string
}

variable "avx_aws_uk_spoke_prod_gw_name" {
    type = string
}

variable "avx_aws_uk_spoke_prod_gw_instance_size" {
    type = string
}

variable "avx_aws_uk_spoke_prod_vpc_cidr" {
    type = string
}

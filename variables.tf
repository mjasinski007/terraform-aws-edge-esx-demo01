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

variable "vsphere_datacenter" {
    type = string
}

variable "vsphere_datastore"{
    type = string
}

variable "vsphere_network_mgmt_internal" {
    type = string
}

variable "vsphere_network_avtrx_lan" {
    type = string
}

variable "vsphere_network_avtrx_wan" {
    type = string
}

variable "vsphere_resource_pool" {
    type = string
}

variable "vsphere_host" {
    type = string
}

variable "vsphere_ovf_vm_template_name" {
    type = string
}

variable "disk_provisioning" {
    type = string
}

variable "instance_count" {
     type = string
}
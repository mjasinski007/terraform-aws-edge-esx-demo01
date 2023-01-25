### Aviatrix Controller ###

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

### AWS ###

variable "aws_profile" {
  type = string
}

variable "aws_uk_region" {
  type = string
}

### Aviatrix Edge ###

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

variable "wan_public_ip" {
  type = string
}

variable "transit_gws_enable_over_private_network" {
  type = string
}

variable "primary_dns_server_ip" {
  type = string
}

variable "secondary_dns_server_ip" {
  type = string
}

variable "enable_transitive_routing" {
  type = string
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


# VSphere

variable "vsphere_provider_user" {
  type = string
}

variable "vsphere_provider_password" {
  type = string
}

variable "vsphere_provider_vcenter" {
  type = string
}

variable "allow_unverified_ssl" {
  type = bool
}

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_datastore" {
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

variable "remote_ovf_url" {
  type = string
}

variable "local_ovf_path" {
  type = string
}

variable "cdrom_iso_path" {
  type = string
}
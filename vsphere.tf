data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pg_mgmt_internal" {
  name          = var.vsphere_network_mgmt_internal
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pg_avtrx_lan" {
  name          = var.vsphere_network_avtrx_lan
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pg_avtrx_wan" {
  name          = var.vsphere_network_avtrx_wan
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default_resource_pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "esx_host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_ovf_vm_template" "edge_ova" {
  name              = var.vsphere_ovf_vm_template_name
  disk_provisioning = var.disk_provisioning
  resource_pool_id  = data.vsphere_resource_pool.default_resource_pool.id
  datastore_id      = data.vsphere_datastore.datastore.id
  host_system_id    = data.vsphere_host.esx_host.id
  remote_ovf_url    =  "https://pubstorage8899.s3.eu-west-2.amazonaws.com/edge_ovf/avx-edge-gateway.ovf"
  #local_ovf_path    = "/home/vmario/vDEVNET_Projects/Terraform/terraform-aws-edge-esx-demo01/ovf_template/avx-edge-gateway.ovf"
  ovf_network_map = {
    "WAN_Interface" : data.vsphere_network.pg_avtrx_wan.id,
    "LAN_Interface" : data.vsphere_network.pg_avtrx_lan.id,
    "MGMT_Interface" : data.vsphere_network.pg_mgmt_internal.id
  }
}

resource "vsphere_file" "edge_config_iso_upload" {
  datacenter         = data.vsphere_datacenter.datacenter.name
  datastore          = data.vsphere_datastore.datastore.name
  source_file        = "./${var.edge_gw_name}-${var.side_id}.iso"
  destination_file   = "ISO/edge_config_ready_to_deploy.iso"
  create_directories = false

  depends_on = [
    module.edge_esx_gw01,
  ]
}

resource "vsphere_virtual_machine" "vedge_vm" {
  count            = var.instance_count
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  name             = var.edge_gw_name
  num_cpus         = data.vsphere_ovf_vm_template.edge_ova.num_cpus
  memory           = data.vsphere_ovf_vm_template.edge_ova.memory
  guest_id         = data.vsphere_ovf_vm_template.edge_ova.guest_id
  resource_pool_id = data.vsphere_ovf_vm_template.edge_ova.resource_pool_id
  datastore_id     = data.vsphere_ovf_vm_template.edge_ova.datastore_id
  host_system_id   = data.vsphere_ovf_vm_template.edge_ova.host_system_id

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  
  network_interface {
    network_id = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map["WAN_Interface"]
  }
  
  network_interface {
    network_id = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map["LAN_Interface"]
  }
  
  network_interface {
    network_id = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map["MGMT_Interface"]
  }

  ovf_deploy {
    remote_ovf_url    = data.vsphere_ovf_vm_template.edge_ova.remote_ovf_url
    #local_ovf_path    = data.vsphere_ovf_vm_template.edge_ova.local_ovf_path # Used when file stored locally
    disk_provisioning = data.vsphere_ovf_vm_template.edge_ova.disk_provisioning
    deployment_option = data.vsphere_ovf_vm_template.edge_ova.deployment_option
    ip_protocol       = data.vsphere_ovf_vm_template.edge_ova.ip_protocol
    ovf_network_map   = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISO/edge_config_ready_to_deploy.iso"
  }
  
  lifecycle {
    ignore_changes = [
        annotation,
        disk[0].io_share_count,
    ]
  }
  
  depends_on = [
    module.edge_esx_gw01,
    vsphere_file.edge_config_iso_upload
    ]
 }
#

data "vsphere_datacenter" "datacenter" {
    name = "ha-datacenter"
}

data "vsphere_datastore" "datastore" {
    name          = "SSD_LOCAL"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pg_mgmt_internal" {
    name          = "pg_mgmt_internal"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_network" "pg_avtrx_lan10" {
    name          = "pg_avtrx_lan10"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pg_avtrx_wan200" {
    name          = "pg_avtrx_wan200"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default_resource_pool" {
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "esx_host" {
    name = "192.168.2.105"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_ovf_vm_template" "edge_ova" {
    name              = "edge_ova"
    disk_provisioning = "thin"
    resource_pool_id  = data.vsphere_resource_pool.default_resource_pool.id
    datastore_id      = data.vsphere_datastore.datastore.id
    host_system_id    = data.vsphere_host.esx_host.id
    local_ovf_path    = "/Users/vmario/vDEVNET_Projects/13.AVIATRIX/01.AVIATRIX_GITHUB/02.Practice_Lab_Scenarios/terraform-aws-edge-esx-demo01/avx-edge-gateway-vmware-2022-10-26.ova"
    ovf_network_map = {
        "WAN Interface" : data.vsphere_network.pg_avtrx_wan200.id,
        "LAN Interface" : data.vsphere_network.pg_avtrx_lan10.id,
        "MGMT Interface" : data.vsphere_network.pg_mgmt_internal.id
    }
}

resource "vsphere_virtual_machine" "vm" {
    count            = "1" #var.instance_count
    datacenter_id    = data.vsphere_datacenter.datacenter.id
    name             = "Test"
    num_cpus         = data.vsphere_ovf_vm_template.edge_ova.num_cpus
    memory           = data.vsphere_ovf_vm_template.edge_ova.memory
    guest_id         = data.vsphere_ovf_vm_template.edge_ova.guest_id
    resource_pool_id = data.vsphere_ovf_vm_template.edge_ova.resource_pool_id
    datastore_id     = data.vsphere_ovf_vm_template.edge_ova.datastore_id
    host_system_id   = data.vsphere_ovf_vm_template.edge_ova.host_system_id

    wait_for_guest_net_timeout = 0
    wait_for_guest_ip_timeout  = 0

    dynamic "network_interface" {
        for_each = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map
        content {
            network_id = network_interface.value
        }
    }

    ovf_deploy {
        local_ovf_path    = data.vsphere_ovf_vm_template.edge_ova.local_ovf_path
        disk_provisioning = data.vsphere_ovf_vm_template.edge_ova.disk_provisioning
        deployment_option = data.vsphere_ovf_vm_template.edge_ova.deployment_option
        ip_protocol       = data.vsphere_ovf_vm_template.edge_ova.ip_protocol
        ovf_network_map   = data.vsphere_ovf_vm_template.edge_ova.ovf_network_map
    }

    /* vapp {
        properties = {
            "guestinfo.hostname" = "tf-nested-esxi-2.primp-industries.com",
            "guestinfo.ipaddress" = "192.168.30.181",
            "guestinfo.netmask" = "255.255.255.0",
            "guestinfo.gateway" = "192.168.30.1",
            "guestinfo.dns" = "192.168.30.1",
            "guestinfo.domain" = "primp-industries.com",
            "guestinfo.ntp" = "pool.ntp.org",
            "guestinfo.password" = "VMware1!23",
            "guestinfo.ssh" = "True"
        }
    } */

    lifecycle {
        ignore_changes = [
            annotation,
            disk[0].io_share_count,
            disk[1].io_share_count,
            disk[2].io_share_count,
            vapp[0].properties,
        ]
}
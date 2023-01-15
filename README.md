# Objectives

- End-to-End **Edge 2.0** gateway provision using Terraform on VMware ESX host (On-Prem). 
- Attach newly deployed **Edge gateway** into the existing Aviatrix Transit.

# Prerequisites

- VMware ESX host and VMware vCenter (Required)
- Aviatrix Transit VPC/Gateways deployed (Optionally)
- Aviatrix Spoke VPC/Gateways deployed (Optionally)

# Topology

- Physical/Logical connections in my lab. 

![Screenshot 2023-01-15 at 16 40 52](https://user-images.githubusercontent.com/102957943/212554017-883aa631-40ac-4ac4-87b7-2b96dad4f4f0.png)

# Deployments

- Please clone the code and please provide your values in the `variables.auto.tfvars` file. 
- In case if you use the `.ova` file locally, the following amends have to be done:
 - Amend the following file `vmaware_esxi.tf` as follows: 

```hcl
data "vsphere_ovf_vm_template" "edge_ova" { 
  .....(omitted)....
  local_ovf_path = "/your_local_path_to_file/avx-edge-gateway-vmware-2022-10-26.ova"
}

resource "vsphere_virtual_machine" "vedge_vm" {
  ....(omitted)....
  
  vf_deploy {
    local_ovf_path  = data.vsphere_ovf_vm_template.edge_ova.local_ovf_path
  }
}
```

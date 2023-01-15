# Objectives

- End-to-End **Edge 2.0** gateway provision using Terraform on VMware ESX host (On-Prem). 
- Attach newly deployed **Edge gateway** into the existing Aviatrix Transit.

# Prerequisites

- VMware ESX host and VMware vCenter (Required)
- Aviatrix Transit VPC/Gateways deployed (Optionally)
- Aviatrix Spoke VPC/Gateways deployed (Optionally)

# Topology

- Physical/Logical connections in my lab. 

![Screenshot 2023-01-15 at 16 54 28](https://user-images.githubusercontent.com/102957943/212554648-ff81bb1b-0c8d-49f0-a2bf-9e7e5813e143.png)


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

- In order to use remote site where `ova` template is located, do some chnages in the `vmaware_esxi.tf` file:

```hcl
data "vsphere_ovf_vm_template" "edge_ova" { 
  .....(omitted)....
  remote_ovf_url = "https://bucked_name.s3.eu-west-2.amazonaws.com/avx-edge-gateway-vmware-2022-10-26.ova"
}

resource "vsphere_virtual_machine" "vedge_vm" {
  ....(omitted)....
  
  vf_deploy {
    remote_ovf_url  = data.vsphere_ovf_vm_template.edge_ova.remote_ovf_url
  }
}
```





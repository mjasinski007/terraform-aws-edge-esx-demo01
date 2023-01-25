# Objectives

- End-to-End **Edge 2.0** gateway provision using Terraform on VMware ESX host (On-Prem). 
- Create intial Edge configuration as `.ISO` file
- Attach newly deployed and registered **Edge gateway** into the existing Aviatrix Transit.

# Prerequisites

- VMware ESX host and VMware vCenter (Required)
- Aviatrix Transit VPC/Gateways deployed (Optionally)
- Aviatrix Spoke VPC/Gateways deployed (Optionally)

# Topology

- Physical/Logical connections in my lab. 

![Screenshot 2023-01-25 at 22 30 53](https://user-images.githubusercontent.com/102957943/214706833-a9ebc3e7-56c5-424a-a88c-63d2da8ab740.png)


# Deployments

- Please clone the repository and provide your variable values in the `variables.auto.tfvars` file.


## OVA Template


- In case if you use the `.ova` file located locally, the following amends have to be done in the `vmaware_esxi.tf` file:

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

- In order to use remote site where `ova` template is located (e.q S3 bucket), do some changes as follows:

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

## Attaching to Aviatrix Transit Gateways

- After successfully deployment, please attach the edge gateway to aviatrix gateways by uncommneting the following parameter in the `variables.auto.tfvars` file.

```hcl
avx_aws_transit_attached  = true
```

- Issue the `terraform apply` again.




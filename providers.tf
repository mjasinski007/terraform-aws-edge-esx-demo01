provider "aviatrix" {
    controller_ip = var.ctrl_ip
    username      = var.ctrl_username
    password      = var.ctrl_password
}

provider "aws" {
    profile = var.aws_profile
    region  = var.aws_uk_region
    alias   = "aws_uk_region_alias"
}

provider "vsphere" {
    user                 = var.vsphere_provider_user
    password             = var.vsphere_provider_password
    vsphere_server       = var.vsphere_provider_vcenter
    allow_unverified_ssl = var.allow_unverified_ssl
}

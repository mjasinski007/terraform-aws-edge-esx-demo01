provider "aviatrix" {
    controller_ip = var.ctrl_ip
    username      = var.ctrl_username
    password      = var.ctrl_password
}

provider "aws" {
    profile = var.aws_profile
    region  = var.aws_uk_region
}

provider "aws" {
    profile = var.aws_profile
    region  = var.aws_uk_region
    alias   = "aws_uk_region_alias"
}

provider "vsphere" {
    user                 = "administrator@vdevnetpro.com"
    password             = "CHANGEME"
    vsphere_server       = "vcenter7srv01.vdevnetpro.com"
    allow_unverified_ssl = true # If you have a self-signed cert
}

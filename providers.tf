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
    user                 = "administrator@192.168.0.154"
    password             = "Qaz!741852"
    #vsphere_server      = "192.168.0.154"
    vsphere_server       = "89.69.144.149" # Used exernally e.g Terraform Cloud
    allow_unverified_ssl = true # If you have a self-signed cert
}

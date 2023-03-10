terraform {
    required_providers {
        aviatrix = {
            source  = "aviatrixsystems/aviatrix"
            version = "~>3.0.0"
        }
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
        vsphere = {
            source  = "hashicorp/vsphere"
            version = "~> 2.2.0"
        }
    }
    required_version = ">= 1.0"
}
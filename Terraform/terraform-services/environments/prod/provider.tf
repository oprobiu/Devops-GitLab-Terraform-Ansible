terraform {
  required_version = "~>1.6"

  backend "http" {
    skip_cert_verification = true
  }

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~>0"
    }
  }
}

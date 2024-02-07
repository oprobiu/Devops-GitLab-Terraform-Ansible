terraform {
  required_version = "~>1.5.0"

  # backend "http" {
  #   skip_cert_verification = true
  # }

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~>2"
    }
    pve = {
      source  = "bpg/proxmox"
      version = "~>0.0"
    }
  }
}

provider "proxmox" {}
provider "pve" {
  insecure = true
}

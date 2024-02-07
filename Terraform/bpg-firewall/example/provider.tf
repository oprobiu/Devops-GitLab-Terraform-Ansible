terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~>0.27.0"
    }
  }
}

provider "proxmox" {
  # temporary measure, to skip certification error
  insecure = true
}
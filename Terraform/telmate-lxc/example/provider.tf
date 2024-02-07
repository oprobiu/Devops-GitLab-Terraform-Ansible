terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }

    bpg = {
      source = "bpg/proxmox"
      version = "0.43.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "proxmox" {}

provider "bpg" {}
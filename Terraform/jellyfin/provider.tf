terraform {
  required_version = "~>1.5.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~>2.9.14"
    }
    pve = {
      source  = "bpg/proxmox"
      version = "~>0.0"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://PROXMOX_DOMAIN:8006/api2/json"
}

provider "pve" {
  endpoint = "https://PROXMOX_DOMAIN:8006"
  insecure = true
}

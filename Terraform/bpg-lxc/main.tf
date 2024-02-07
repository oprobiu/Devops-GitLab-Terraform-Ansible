terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.34"
    }
  }
}

resource "random_password" "ct-root-pw" {
  length = 24
}

resource "proxmox_virtual_environment_container" "ct" {
  description   = var.ct-description
  node_name     = var.ct-pve-node
  vm_id         = var.ct-id
  pool_id       = var.ct-pool
  started       = var.ct-start
  start_on_boot = var.ct-start-on-boot
  unprivileged  = var.ct-unprivileged

  cpu {
    architecture = "amd64"
    cores        = var.ct-cpu-cores
  }

  memory {
    dedicated = var.ct-memory
    swap      = 0
  }

  disk {
    datastore_id = var.ct-disk-datastore-id
    size         = var.ct-disk-size
  }

  network_interface {
    enabled = true
    name    = "eth0"
    bridge  = "vmbr0"
  }

  initialization {
    hostname = var.ct-hostname
    ip_config {
      ipv4 {
        address = var.ct-ip
        gateway = var.ct-net-gw
      }
    }
    user_account {
      keys     = var.ct-root-ssh-keys
      password = random_password.ct-root-pw.result
    }
  }

  operating_system {
    template_file_id = var.ct-os
    type             = var.ct-os-type
  }

  features {
    nesting = var.ct-virtualization-nesting
  }

  tags = var.ct-tags

  lifecycle {
    ignore_changes = [
      description,
      tags
    ]
  }
}

module "fw" {
  count   = var.ct-fw-rules != null ? 1 : 0
  source = "GITLAB_URL/ang/bpg/firewall"
  version = "0.1.1-bugfix"

  rule-node  = proxmox_virtual_environment_container.ct.node_name
  ct-rule    = true
  rule-ct-id = proxmox_virtual_environment_container.ct.vm_id
  fw-rule    = var.ct-fw-rules
}

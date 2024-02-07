terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
    pve = {
      source = "bpg/proxmox"
    }
  }
}

resource "random_password" "ct_root_pass" {
  length = 24
}

resource "proxmox_lxc" "ct" {
  hostname     = var.ct-hostname
  target_node  = var.ct-pve-node
  vmid         = var.ct-id
  description  = var.ct-description
  unprivileged = var.ct-unprivileged
  onboot       = var.ct-start-on-boot
  start        = var.ct-start
  startup      = var.ct-startup
  console      = true
  cmode        = "shell"

  ostemplate = var.ct-os-template

  clone = var.ct-clone-id
  full  = var.ct-full-clone

  cores  = var.ct-cpu-cores
  memory = var.ct-ram

  rootfs {
    size    = var.ct-root-disk-size
    storage = var.ct-root-disk-location
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    gw       = var.ct-net-gw
    ip       = var.ct-ip
  }

  ssh_public_keys = var.ct-ssh-keys
  password        = random_password.ct_root_pass.result

  features {
    nesting = var.ct-virtualization-nesting
  }

  pool       = var.ct-pve-pool
  protection = var.ct-protection
  tags       = var.ct-tags

  lifecycle {
    ignore_changes = [
      description, features, tags
    ]
    precondition {
      condition     = (var.ct-os-template != null && var.ct-clone-id == null) || (var.ct-os-template == null && var.ct-clone-id != null)
      error_message = "Exactly one of ct-os-template or ct-clone-id must be true"
    }
  }
}

module "fw" {
  count      = var.ct-fw-rules != null ? 1 : 0
  source = "GITLAB_URL/ang/bpg/firewall"
  version = "0.1.X"

  rule-node  = proxmox_lxc.ct.target_node
  ct-rule    = true
  rule-ct-id = proxmox_lxc.ct.vmid
  fw-rule    = var.ct-fw-rules
}

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm-hostname
  desc        = "Managed by Terraform"
  target_node = var.vm-pve-node
  vmid        = var.vm-id
  agent       = 1

  # either this
  iso = var.vm-iso
  # or these
  clone      = var.vm-clone-base
  full_clone = var.vm-full-clone

  qemu_os  = "l26"
  oncreate = var.vm-start-on-create
  onboot   = var.vm-start-on-boot
  startup  = var.vm-startup-order
  bios     = "ovmf"
  cpu      = "host"
  sockets  = 1
  cores    = var.vm-cpu-cores
  memory   = var.vm-memory
  balloon  = 1

  network {
    bridge   = "vmbr0"
    firewall = true
    model    = "virtio"
  }

  scsihw = "virtio-scsi-single"
  disk {
    type     = "scsi"
    storage  = "KVM"
    size     = var.vm-disk-size
    format   = "raw"
    iothread = 1
  }

  pool = var.vm-pool
  tags = var.vm-tags

  lifecycle {
    ignore_changes = [
      pool, tags
    ]
  }

}

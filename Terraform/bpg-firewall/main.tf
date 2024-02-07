terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

resource "proxmox_virtual_environment_firewall_rules" "fw" {
  node_name    = var.rule-node
  vm_id        = var.vm-rule ? var.rule-vm-id : null
  container_id = var.ct-rule ? var.rule-ct-id : null

  dynamic "rule" {
    for_each = var.fw-rule
    content {
      enabled = rule.value["enabled"]
      type    = rule.value["type"]
      action  = rule.value["action"]
      source  = rule.value["source"]
      dest    = rule.value["dest"]
      dport   = rule.value["dport"]
      proto   = rule.value["proto"]
      log     = rule.value["log"]
      comment = format("%s %s", rule.value["comment"], "; Managed by Terraform")
    }
  }

  lifecycle {
    precondition {
      condition     = (var.vm-rule == true && var.ct-rule != true) || (var.vm-rule != true && var.ct-rule == true)
      error_message = "Exactly one of vm-rule or ct-rule must be true"
    }
    precondition {
      condition     = (var.vm-rule == true && var.rule-vm-id != null) || (var.ct-rule == true && var.rule-ct-id != null)
      error_message = "VM or container ID missing!"
    }
    precondition {
      condition     = (var.rule-vm-id != null && var.rule-ct-id == null) || (var.rule-vm-id == null && var.rule-ct-id != null)
      error_message = "Exactly one of rule-vm-id or rule-ct-id must be set"
    }
  }
}

resource "proxmox_virtual_environment_firewall_options" "fw-opts" {
  node_name    = proxmox_virtual_environment_firewall_rules.fw.node_name
  vm_id        = proxmox_virtual_environment_firewall_rules.fw.vm_id
  container_id = proxmox_virtual_environment_firewall_rules.fw.container_id

  enabled       = true
  dhcp          = true
  ndp           = true
  radv          = false
  macfilter     = true
  ipfilter      = false
  log_level_in  = "nolog"
  log_level_out = "nolog"
  input_policy  = "DROP"
  output_policy = "ACCEPT"
}

module "vaultwarden" {
  source  = "PATH/TO/BPG/LXC"
  version = "0.0.X"

  for_each = var.vwarden_cts

  ct-pve-node     = local.pve_node
  ct-pool         = "prod"
  ct-id           = "${local.lxc_id_prefix}${each.value.id-suffix}"
  ct-unprivileged = true
  # ct-start             = false
  ct-hostname          = each.value.hostname
  ct-os                = local.lxc_template_debian
  ct-os-type           = "debian"
  ct-cpu-cores         = 1
  ct-memory            = 256
  ct-disk-size         = 3
  ct-disk-datastore-id = local.ct_root_disk_location
  ct-net-gw            = local.net_gw
  ct-ip                = "${local.ip_prefix}.${each.value.id-suffix}/24"

  ct-root-ssh-keys = [
    var.ANSIBLE_USER_PUBLIC_KEY
  ]

  ct-fw-rules = merge(
    {
      ssh = {
        "enabled" = "true"
        "type"    = "in"
        "action"  = "ACCEPT"
        "comment" = "SSH"
        "dport"   = "22"
        "proto"   = "tcp"
        "log"     = "info"
      },
      http = {
        "enabled" = "true"
        "type"    = "in"
        "action"  = "ACCEPT"
        "comment" = "HTTP"
        "dport"   = "80"
        "proto"   = "tcp"
        "log"     = "info"
      },
      https = {
        "enabled" = "true"
        "type"    = "in"
        "action"  = "ACCEPT"
        "comment" = "HTTPS"
        "dport"   = "443"
        "proto"   = "tcp"
      "log" = "info" }
    },
    local.domain_fw_rules
  )

  ct-tags = [
    "nginx",
    "prod",
    "services",
    "vaultwarden"
  ]
}

module "postgresql" {
  source  = "PATH/TO/BPG/LXC"
  version = "0.0.X"

  for_each = var.pgsql_cts

  ct-pve-node          = local.pve_node
  ct-pool              = "prod"
  ct-id                = "${local.lxc_id_prefix}${each.value.id-suffix}"
  ct-unprivileged      = false
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
      postgresql = {
        "enabled" = "true"
        "type"    = "in"
        "action"  = "ACCEPT"
        "comment" = "PostgreSQL"
        "dport"   = "5432"
        "proto"   = "tcp"
        "log"     = "info"
      },
    },
    local.domain_fw_rules
  )

  ct-tags = [
    "postgresql",
    "prod",
    "services"
  ]
}

module "wireguard" {
  source  = "PATH/TO/TELMATE/LXC"
  version = "0.0.X"

  for_each = var.wg_ct

  ct-pve-node           = local.pve_node
  ct-pve-pool           = var.DEPLOYMENT_ENVIRONMENT
  ct-id                 = "${local.lxc_id_prefix}${var.DEPLOYMENT_ENVIRONMENT == "prod" ? each.value.id-suffix : "200"}"
  ct-protection         = local.ct_protection
  ct-hostname           = each.value.hostname
  ct-os-template        = local.lxc_template_debian
  ct-ram                = 128
  ct-root-disk-size     = "1G"
  ct-root-disk-location = local.ct_root_disk_location
  ct-net-gw             = local.net_gw
  ct-ip                 = var.DEPLOYMENT_ENVIRONMENT == "prod" ? "10.0.0..${each.value.id-suffix}/24" : "10.0.0.200/24"
  ct-ssh-keys           = var.ANSIBLE_USER_PUBLIC_KEY

  ct-fw-rules = {
    ssh = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "SSH"
      "source"  = ""
      "dest"    = ""
      "dport"   = "22"
      "proto"   = "tcp"
      "log"     = "info"
    }
    wireguard = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "WIREGUARD"
      "source"  = ""
      "dest"    = ""
      "dport"   = "51820"
      "proto"   = "udp"
      "log"     = "info"
    }
    wgdashboard = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "WGDASHBOARD"
      "source"  = ""
      "dest"    = ""
      "dport"   = "80"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }

  ct-tags = "services;${var.DEPLOYMENT_ENVIRONMENT};wireguard"
}

module "gitlab-runner" {
  source = "$GITLAB_HOST/PATH/TO/TELMATE-LXC"
  version = "0.1.2"

  for_each = var.gl_runner

  ct-pve-node           = local.pve_node
  ct-pve-pool           = var.DEPLOYMENT_ENVIRONMENT
  ct-id                 = "${local.lxc-id-prefix}${each.value.id-suffix}"
  ct-start              = false
  ct-unprivileged       = false
  ct-protection         = local.ct_protection
  ct-hostname           = each.value.hostname
  ct-os-template        = local.lxc_template_debian
  ct-ram                = 192
  ct-root-disk-size     = "5G"
  ct-root-disk-location = local.ct_root_disk_location
  ct-net-gw             = local.net_gw
  ct-ip                 = each.value.ip
  ct-ssh-keys           = var.ANSIBLE_USER_PUBLIC_KEY

  ct-fw-rules = {
    rule1 = {
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
    rule2 = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "GL-RUNNER"
      "source"  = ""
      "dest"    = ""
      "dport"   = "33084"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }
  ct-tags = "core;${var.DEPLOYMENT_ENVIRONMENT};gitlab-runner"
}

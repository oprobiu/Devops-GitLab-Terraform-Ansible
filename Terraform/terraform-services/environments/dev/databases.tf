module "postgresql" {
  source  = "PATH/TO/TELMATE/LXC"
  version = "0.0.X"

  for_each = var.pgsql_cts

  ct-pve-node           = local.pve_node
  ct-pve-pool           = var.DEPLOYMENT_ENVIRONMENT
  ct-id                 = "${local.lxc_id_prefix}${each.value.id-suffix}"
  ct-protection         = true
  ct-unprivileged       = false
  ct-start              = false
  ct-hostname           = "dev${each.value.hostname}"
  ct-os-template        = local.lxc_template_debian
  ct-cpu-cores          = 1
  ct-ram                = 256
  ct-root-disk-size     = "1G"
  ct-root-disk-location = local.ct_root_disk_location
  ct-net-gw             = local.net_gw
  ct-ip                 = "${local.ip_prefix}.${each.value.id-suffix}/24"
  ct-ssh-keys           = var.ANSIBLE_USER_PUBLIC_KEY

  ct-tags = "services;${var.DEPLOYMENT_ENVIRONMENT};postgresql"
}

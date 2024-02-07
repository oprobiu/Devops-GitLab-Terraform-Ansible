locals {
  lxc_template_debian   = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  net_gw                = "10.0.0.1"
  pve_node              = "pve"
  ct_root_disk_location = "pve"
  lxc_id_prefix         = "4"
  ip_prefix             = "10.0.0."
}


locals {
  lxc_template_debian   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  net_gw                = "$GATEWAY_URL"
  pve_node              = var.DEPLOYMENT_ENVIRONMENT == "prod" ? "pve" : var.DEPLOYMENT_ENVIRONMENT == "dev" ? "pve" : null
  ct_root_disk_location = var.DEPLOYMENT_ENVIRONMENT == "prod" ? "pve" : var.DEPLOYMENT_ENVIRONMENT == "dev" ? "pve" : null
  ct_protection         = var.DEPLOYMENT_ENVIRONMENT == "prod" ? "true" : "false"
  lxc-id-prefix         = var.DEPLOYMENT_ENVIRONMENT == "prod" ? 2 : var.DEPLOYMENT_ENVIRONMENT == "dev" ? 4 : null
}

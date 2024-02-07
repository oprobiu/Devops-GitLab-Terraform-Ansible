locals {
  lxc_template_debian   = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  net_gw                = "10.0.0.1"
  pve_node              = "pve"
  ct_root_disk_location = "pve"
  ct_protection         = "true"
  ip_prefix             = "10.0.0"
  lxc_id_prefix         = 2
  domain_fw_rules = {
    KDC_TCP = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "KDC"
      "dport"   = "88"
      "proto"   = "tcp"
      "log"     = "info"
    }
    KDC_UDP = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "KDC"
      "dport"   = "88"
      "proto"   = "udp"
      "log"     = "info"
    }
    LDAP = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "LDAP"
      "dport"   = "389"
      "proto"   = "tcp"
      "log"     = "info"
    }
    FIPA_TCP = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "fipa"
      "dport"   = "464"
      "proto"   = "tcp"
      "log"     = "info"
    }
    FIPA_UDP = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "fipa"
      "dport"   = "464"
      "proto"   = "udp"
      "log"     = "info"
    }
  }
}


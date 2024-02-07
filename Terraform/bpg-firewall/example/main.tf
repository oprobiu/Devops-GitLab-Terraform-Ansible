module "ct_firewall" {
  source = "../"

  rule-node  = "pve"
  ct-rule    = true
  rule-ct-id = 190

  fw-rule = {
    http = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "HTTP"
      "dport"   = "80"
      "proto"   = "tcp"
      "log"     = "info"
    }
    https = {
      "enabled" = "false"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "HTTPS"
      "dport"   = "443"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }
}

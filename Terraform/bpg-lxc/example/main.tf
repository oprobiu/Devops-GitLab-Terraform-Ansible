module "example_ct" {
  source = "../"

  ct-pve-node     = "pve"
  ct-pool         = "dev"
  ct-id           = 9999
  ct-unprivileged = true
  ct-start        = false
  ct-hostname     = "test"
  ct-cpu-cores    = 1
  ct-memory       = 256
  ct-disk-size    = 1
  ct-net-gw       = "GATEWAY_URL"
  ct-fw-rules = {
    ssh = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "SSH"
      "dport"   = "22"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }

  ct-disk-datastore-id = "pve-LXC"

  ct-os      = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"

  ct-os-type = "debian"

  ct-tags = [
    "dev",
    "test"
  ]
}

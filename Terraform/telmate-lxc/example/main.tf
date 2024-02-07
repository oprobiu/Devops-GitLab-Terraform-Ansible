module "example-ct" {
  source = "../"

  ct-hostname   = "test-cts"
  ct-pve-node   = "pve"
  ct-id         = 1111
  ct-net-gw     = "GATEWAY_IP"
  ct-ip         = "CONTAINER_IP/24"
  ct-ram        = 128
  ct-root-disk-size = "1G"
  ct-fw-rules   = {
    http = {
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "HTTP"
      "dport"   = "80"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }
  ct-os-template = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  ct-root-disk-location = "local-lvm"

}

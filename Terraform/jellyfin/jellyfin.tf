module "jellyfin" {
  source  = "git.camarad.tech/iac/telmate/lxc"
  version = "0.0.5"

  ct-pve-node           = "pve"
  ct-pve-pool           = "dev"
  ct-id                 = 4201
  ct-protection         = false
  ct-hostname           = "jfin"
  ct-os-template        = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  ct-ram                = 128
  ct-root-disk-size     = "1G"
  ct-root-disk-location = "pve"
  ct-net-gw             = "10.0.0.1"
  ct-ip                 = "10.0.0.201/24"
  ct-ssh-keys           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9oHvuYmXvo/INmezThIJ7SYeExYHaLRAok4z6AKDTNCm+tXjGHkqJGGUSrdPDWCKOqN97MCXctrr2cnaaTzS8ApM7iEme/5ZgZf8m0n7UCRrfVwcmFJ1mWfwBi1BTksne0+WlfwqMHatBnpm8khtpp4/RhILI9Bv+nDOfavie/bdm//xXFK0Smoeni8RAU5Y+1DXJXtTmUTmOdioroNCBMc98e/GIaEnnpQlTnToBCMomO5c+x/Atmaquj1gyI6azcIZ7l5r7PcLpn6NUtbfrpUfjGnWTl/3sb3KhxRCCXCyXfjhJ6GILb8x7G8PAcpwkivBbsWVZp/8Ut4pAQqHqiy6DGU4SpzU7Zx2GFX+fD3ZgOTwQTEcfa4fsBpkj74wvftd0JlzwD8nToyC/FXnspAXFORGFUCar9MuCbUOodqhI8eUDaTePSA7oYXFcN0DufAvtMcr6eBpQm3K5OJVOFFJH7J1iVzwbwghiiEHY6gEv4PhuDSkzBYMLPcdAkuU= robert mihai ionita@DESKTOP-77LF749"

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
      "enabled" = "true"
      "type"    = "in"
      "action"  = "ACCEPT"
      "comment" = "HTTPS"
      "dport"   = "443"
      "proto"   = "tcp"
      "log"     = "info"
    }
  }

}

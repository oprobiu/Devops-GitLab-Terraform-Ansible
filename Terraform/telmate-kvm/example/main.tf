module "example-vm" {
  source = "../"

  vm-hostname = "example-vm-test"
  vm-pve-node = "pve"
  vm-id       = "1111"
  vm-iso      = "local:iso/debian-12.2.0-amd64-DVD-1.iso"
}

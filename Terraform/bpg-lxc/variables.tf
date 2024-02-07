variable "ct-description" {
  type        = string
  description = "Description of the contianer."
  default     = <<EOT
Managed by Terraform
EOT
}

variable "ct-pve-node" {
  description = "PVE node where to deploy the container"
  type        = string
}

variable "ct-id" {
  description = "The id the container should have in PVE"
  type        = number
}

variable "ct-pool" {
  description = "PVE pool in which to allocate the container"
  type        = string
}

variable "ct-start" {
  description = "If the container should be in a started state right after deployment."
  type        = bool
  default     = true
}

variable "ct-start-on-boot" {
  type        = bool
  description = "Should the container start at Proxmox host boot?"
  default     = true
}

variable "ct-unprivileged" {
  description = "Should the container be unprivileged"
  type        = bool
  default     = true
}

variable "ct-cpu-cores" {
  description = "Number of cpu cores the container should be allowed to use"
  type        = number
  default     = 1
}

variable "ct-disk-datastore-id" {
  description = "Id of the PVE datastore where the containers disk should be created"
  type        = string
  default     = null
}

variable "ct-disk-size" {
  description = "The size of the containers disk in GB"
  type        = number
  default     = 5
}

variable "ct-memory" {
  description = "Amount of RAM in MB to allocate to the container"
  type        = number
  default     = 512
}

variable "ct-hostname" {
  description = "Hostname of the container"
  type        = string
  default     = null
}

variable "ct-ip" {
  description = "IP of the container"
  type        = string
  default     = null
}

variable "ct-net-gw" {
  type        = string
  description = "Internet gateway for container."
  default     = null
}

variable "ct-root-ssh-keys" {
  description = "SSH keys for the root account of the container as list of string"
  type        = list(string)
  default     = null
}

variable "ct-os" {
  description = "LXC template to use for container"
  type        = string
}

variable "ct-os-type" {
  description = "LXC os type (debian, arch, etc...)"
  type        = string
}

variable "ct-virtualization-nesting" {
  description = "Should the container allow for nested virtualization"
  type        = bool
  default     = false
}

variable "ct-tags" {
  description = "Tags to be added to the container"
  type        = list(string)
}

variable "ct-fw-rules" {
  description = "Firewall rules to add to the container"
  type = map(object({
    enabled = string
    type    = string
    action  = string
    comment = string
    source  = optional(string)
    dest    = optional(string)
    dport   = string
    proto   = string
    log     = string
  }))
  default = null
}

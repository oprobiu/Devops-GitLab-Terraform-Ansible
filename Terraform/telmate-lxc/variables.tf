variable "ct-hostname" {
  type        = string
  description = "Container hostname."
}

variable "ct-pve-node" {
  type        = string
  description = "Proxmox VE node where the container will be deployed."
}

variable "ct-id" {
  type        = number
  description = "The id assigned to this container in Proxmox."
}

variable "ct-description" {
  type        = string
  description = "Description of the contianer."
  default     = <<EOT
Managed by Terraform
EOT
}

variable "ct-unprivileged" {
  type        = bool
  description = "Container privilege."
  default     = true
}

variable "ct-start-on-boot" {
  type        = bool
  description = "Should the container start at Proxmox host boot?"
  default     = true
}

variable "ct-start" {
  type        = bool
  description = "Should the contaienr start right after deployment?"
  default     = true
}

variable "ct-startup" {
  type        = string
  description = "Startup order of the container."
  default     = null
}

variable "ct-cpu-cores" {
  type        = number
  description = "Number of cores to be allocated to container."
  default     = 1
}

variable "ct-os-template" {
  type        = string
  description = "Template to use for deploying container"
  default     = null
}

variable "ct-clone-id" {
  type        = string
  description = "Id of the container to be cloned"
  default     = null
}

variable "ct-full-clone" {
  type        = bool
  description = "Should the container be a full clone?"
  default     = null
}

variable "ct-ram" {
  type        = number
  description = "How much memory to allocate to container."
  default     = 512
}

variable "ct-root-disk-size" {
  type        = string
  description = "Root disk size. (e.g. '10G')"
  default     = "2G"
}

variable "ct-root-disk-location" {
  type        = string
  description = "Proxmox VE storage name where to create the container root disk."
  default     = "local-lvm"
}

variable "ct-net-gw" {
  type        = string
  description = "Internet gateway for container."
}

variable "ct-ip" {
  type        = string
  description = "IP of container in CIRD notation"
  default     = "dhcp"
}

variable "ct-pve-pool" {
  type        = string
  description = "Pool in which to assign container"
  default     = null
}

variable "ct-protection" {
  type        = bool
  description = "Enable container protection in Proxmox VE?"
  default     = false
}

variable "ct-tags" {
  type        = string
  description = "Semicolon separated list of tags to assign to container"
  default     = null
}

variable "ct-ssh-keys" {
  type        = string
  description = "List of ssh public keys to add to the container. Accepts HEREDOC syntax where every key is on it's own line"
  default     = null
}

variable "ct-virtualization-nesting" {
  type        = bool
  description = "Should nested virtualization be enabled in the container?"
  default     = null
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

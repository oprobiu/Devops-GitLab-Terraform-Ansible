variable "rule-node" {
  description = "Node on which the firewall rule should be applied. Do not populate if you want to set a cluster level rule"
  type        = string
}

variable "vm-rule" {
  description = "True if the rule should apply to a VM"
  type        = bool
  default     = false
}

variable "ct-rule" {
  description = "True if the rule should apply to a container"
  type        = bool
  default     = false
}

variable "rule-vm-id" {
  description = "ID of the VM the rule applies to"
  type        = number
  default     = null
}

variable "rule-ct-id" {
  description = "ID of the container the rule applies to"
  type        = number
  default     = null
}

variable "fw-rule" {
  description = "Map of rules to be set"
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

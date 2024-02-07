variable "ANSIBLE_USER_PUBLIC_KEY" {
  description = "Environment variable which holds the public ssh key of the Ansible user which will configure the resource"
  type        = string
  default     = null
}

variable "DEPLOYMENT_ENVIRONMENT" {
  description = "Environment variable which defines the deployment environment"
  type        = string
}

variable "pdrop_cts" {
  description = "Details about the PairDrop containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
  }))
}

variable "pgsql_cts" {
  description = "Details about the PostgreSQL containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
  }))
}

variable "vwarden_cts" {
  description = "Details about the vaultwarden containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
  }))
}

variable "wg_ct" {
  description = "Details about the WireGuard containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
  }))
}

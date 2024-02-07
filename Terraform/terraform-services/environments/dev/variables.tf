variable "ANSIBLE_USER_PUBLIC_KEY" {
  description = "Environment variable which holds the public ssh key of the Ansible user which will configure the resource"
  type        = string
  default     = null
}

variable "DEPLOYMENT_ENVIRONMENT" {
  description = "Environment variable which defines the deployment environment"
  type        = string
}

variable "pgsql_cts" {
  description = "Details about the PairDrop containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = string
  }))
}

variable "vwarden_cts" {
  description = "Details about the vaultwarden containers to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
  }))
}

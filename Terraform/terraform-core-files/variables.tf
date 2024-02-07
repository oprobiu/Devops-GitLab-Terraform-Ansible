variable "DEPLOYMENT_ENVIRONMENT" {
  description = "Environment variable which defines the deployment environment"
  type        = string
}

variable "ANSIBLE_USER_PUBLIC_KEY" {
  description = "Environment variable which holds the public ssh key of the Ansible user which will configure the resource"
  type        = string
  default     = null
}

variable "gl_runner" {
  description = "Details about the GitLab runnes to be deployed"
  type = map(object({
    hostname  = string
    id-suffix = number
    ip        = string
  }))
}

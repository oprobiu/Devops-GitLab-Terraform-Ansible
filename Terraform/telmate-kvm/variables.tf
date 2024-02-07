variable "vm-hostname" {
  description = "Name of the VM"
  type        = string
}

variable "vm-pve-node" {
  description = "PVE node where the VM will be created"
  type        = string
}

variable "vm-id" {
  description = "Id the vm will have in PVE"
  type        = string
}

variable "vm-iso" {
  description = "Installation ISOfor the VM"
  type        = string
  default     = null
}

variable "vm-clone-base" {
  description = "Base VM template from which to clone"
  type        = string
  default     = null
}

variable "vm-full-clone" {
  description = "Should the VM be a full clone?"
  type        = bool
  default     = null
}

variable "vm-start-on-create" {
  description = "Should the VM start after cretion?"
  type        = bool
  default     = false
}

variable "vm-start-on-boot" {
  description = "Should the VM start on PVE boot?"
  type        = bool
  default     = false
}

variable "vm-startup-order" {
  description = "Order in which the VM should start up"
  type        = string
  default     = null
}

variable "vm-cpu-cores" {
  description = "Number of cores to allocate to VM"
  type        = number
  default     = 1
}

variable "vm-memory" {
  description = "Amount of RAM to allotace to VM in MB"
  type        = number
  default     = 512
}

variable "vm-disk-size" {
  description = "Disk size for the VM (e.g. 20G)"
  type        = string
  default     = "2G"
}

variable "vm-pool" {
  description = "Pool in which to allocate VM"
  type        = string
  default     = "dev"
}

variable "vm-tags" {
  description = "Tags to add to VM, separated by semicolon"
  type        = string
  default     = "default;tag"
}

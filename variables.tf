variable "machine_name" {
  type = string
  description = "machine name"
  default = "example"
}

variable "group_name" {
  type = string
  description = "group name"
}

variable "location" {
  type = string
  description = "machine location"
  default = "East US"
}

variable "size" {
  type = string
  description = "size of vm"
  default = "Standard_DS1_v2"
}

variable "nics" {
  type = list(number)
  description = "nics of machine"
}

variable "public_key" {
  type = string
  description = "ssh public key"
}
variable "env_name" {
  type = string
}

variable "dns_zone_name" {
  type = string
}

variable "dns_zone_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "admin_ssh_key" {
  type      = string
  sensitive = true
}

variable "kubernetes_version" {
  type = string
}

variable "subnets" {
  type = list(object({
    id    = string
    cidr  = string
    zone  = string
    index = number
  }))
}

variable "master_machine_type" {
  type = string
}

variable "node_machine_type" {
  type = string
}

variable "node_min_size" {
  type = number
}

variable "node_max_size" {
  type = number
}

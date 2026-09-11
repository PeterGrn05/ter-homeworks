variable "env_name" {
  description = "Environment and VPC network name"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "IPv4 CIDR blocks for subnet"
  type        = list(string)
}
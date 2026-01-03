variable "vpc_name" {
  type = string
  description = "Name for VPC"
}

variable "cidr_block" {
  type = string
  description = "CIDR block for VPC"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "CIDR for Private Subnet"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "CIDR for Public Subnet"
}

variable "availability_zones" {
  type = list(string)
  description = "Availability Zone for VPC"
}

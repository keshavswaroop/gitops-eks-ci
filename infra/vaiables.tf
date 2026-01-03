variable "cluster_name" {
  type = string
  description = "Cluster Name"
  default = "EKS_Cluster"
}

variable "cluster_version" {
  type = number
  description = "Cluster Version"
  default = 1.31
}

variable "subnet_ids" {
  type = list(string)
  description = "Subnet IDs - This is the private subnet ids. It will be taken once vpc is created. Replace the subnet ids below"
  default = [ "subnet-0", "subnet-0"]
}

variable "node_groups" {
  description = "EKS Node Groups"
  type = map(object({
    instance_types = list(string)
    capacity_type = string
    scaling_config = object({
      desired_size = number
      max_size = number
      min_size = number
    })
  }))
    default = {
      "general" = {
        instance_types = ["t3.small"]
        capacity_type = "ON_DEMAND"
        scaling_config = {
            desired_size = 2
            max_size = 4
            min_size = 1
        }
      }
    }
}

variable "vpc_name" {
  type = string
  description = "Name for VPC"
  default = "Practice_VPC"
  
}

variable "cidr_block" {
  type = string
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "CIDR for Private Subnet"
  default = [ "10.0.1.0/24","10.0.2.0/24" ]
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "CIDR for Public Subnet"
  default = [ "10.0.3.0/24","10.0.4.0/24" ]
}

variable "availability_zones" {
  type = list(string)
  description = "Availability Zone for VPC"
  default = [ "eu-north-1a","eu-north-1b" ]
}

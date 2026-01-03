variable "cluster_name" {
  type = string
  description = "Cluster Name"
}

variable "cluster_version" {
  type = number
  description = "Cluster Version"
}

variable "subnet_ids" {
  type = list(string)
  description = "Subnet IDs - This is the private subnet ids. It will taken once vpc is created"

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
}
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to associate with the EKS cluster"
}

variable "private_subnets" {
  
}

variable "public_subnets" {
  
}

variable "instance_count" {
  type        = number
  default     = 2
  description = "Number of worker nodes to create in the EKS cluster"
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# output "public_subnet_ids" {
#   value = module.vpc.public_subnets
# }

output "public_subnet_ids" {
  description = "Indexed public subnet IDs"
  value = {
    for idx, subnet_id in module.vpc.public_subnets :
    "public-subnet-${idx + 1}" => subnet_id
  }
}


output "private_subnet_ids" {
  description = "Indexed private subnet IDs"
  value = {
    for idx, subnet_id in module.vpc.private_subnets :
    "private-subnet-${idx + 1}" => subnet_id
  }
}

output "cluster_name" {
  value = module.eks.cluster_name
}
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "cluster_version" {
  value = module.eks.cluster_version
}
output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

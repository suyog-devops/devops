

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_size   = var.instance_count
      min_size       = 1
      max_size       = 3
      instance_types = ["t3.medium"]
    }
  }
}
module "vpc" {
  source = "./vpc"
  aws_region = var.aws_region
}

module "eks" {
  source = "./eks"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets = module.vpc.public_subnets

  # Ensure EKS depends on VPC creation
  depends_on = [module.vpc]

}
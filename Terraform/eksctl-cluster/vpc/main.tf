provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
    selected_azs = slice(data.aws_availability_zones.available.names, 0, var.max_azs)
    public_subnet_cidrs = [for i in range(var.max_azs) : cidrsubnet(var.vpc_cidr, 8, i)]
    private_subnet_cidrs = [for i in range(var.max_azs) : cidrsubnet(var.vpc_cidr, 8, i+100)]
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

#   azs             = var.azs
#   public_subnets  = var.public_subnets
#   private_subnets = var.private_subnets
  azs             = local.selected_azs
  public_subnets  = local.public_subnet_cidrs
  private_subnets = local.private_subnet_cidrs

  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  #enable_internet_gateway = true

  tags = {
    Terraform   = "true"
  }
}

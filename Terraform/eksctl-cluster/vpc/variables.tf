variable "aws_region" {
  type = string
}

variable "vpc_name" {
  default = "my-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# variable "azs" {
#   type = list(string)
#   default = ["us-east-1a", "us-east-1b"]
# }

# variable "public_subnets" {
#   type = list(string)
#   default = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# variable "private_subnets" {
#   type = list(string)
#   default = ["10.0.11.0/24", "10.0.12.0/24"]
# }

variable "max_azs" {
  type        = number
  default     = 2  # Use 2 AZs by default
  description = "Number of AZs to use"
}

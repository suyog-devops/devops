terraform {
  backend "s3" {
    bucket = "suyog-tf-state-lock-bucket"
    #region = var.aws_region  # backend block doesn't allow variables as it gets initialised before variables. pass variables on fly using either -backend-config="region=us-east-1" OR use .hcl file 
    region = "us-west-2"
    key = "global/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
   }
}
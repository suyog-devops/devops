/*
can be used to pass variables to backend.tf on runtime 
terraform init -reconfigure -backend-config=backend-config.hcl

*/

bucket = "suyog-tf-state-lock-bucket"
region = "us-west-2"
key = "global/terraform.tfstate"
dynamodb_table = "terraform-state-lock"
encrypt = true
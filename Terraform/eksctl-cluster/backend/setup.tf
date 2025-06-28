
provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "suyog-tf-state-lock-bucket"
  lifecycle {
    prevent_destroy = var.enable_protect
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name = "terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
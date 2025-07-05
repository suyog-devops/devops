Two Options for Setting Up Remote Backend in Terraform -
Option 1: Manual Setup (Most Common in Production)
    - Manually create the S3 bucket and DynamoDB table in AWS (via Console or CLI)
    - Use them in the backend "s3" block of your Terraform config
    - This allows immediate use of remote backend from the first terraform init

Option 2: Bootstrapped Setup via Terraform (Common in Dev/Test)
    - Temporarily use local backend in a small backend/ module to provision:
        An S3 bucket (for storing state)
        A DynamoDB table (for state locking)
    - Then use those resources in the backend "s3" block of other modules (like vpc/, eks/)
    - You must run this initial Terraform manually (once) using local state before switching to remote state
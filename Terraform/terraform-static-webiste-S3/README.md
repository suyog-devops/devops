# Terraform Static Website on AWS S3 with CloudFront

This project demonstrates deploying a **static website** on **AWS S3** with **CloudFront CDN** and **Origin Access Control (OAC)** using **Terraform**.

---

## 🚀 Features

* S3 bucket for static website hosting
* Private bucket with **public access blocked**
* Automatic upload of website files (`index.html`, `error.html`, CSS/JS)
* CloudFront distribution with **OAC** to securely serve content
* Dynamic MIME type detection for correct content rendering
* Optional CloudFront cache invalidation
* Terraform v1.14.2 compatible
* Modular and reusable Terraform code

---

## 📝 Project Structure

```
.
├── backend.tf          # Terraform backend configuration
├── cloudfront.tf       # CloudFront distribution + OAC
├── main.tf             # Root module (or orchestration)
├── providers.tf        # AWS provider configuration
├── s3.tf               # S3 bucket + file uploads
├── outputs.tf          # Terraform outputs
├── variables.tf        # Input variables
├── variables.tfvars    # Local variable values
├── versions.tf         # Terraform version constraints
└── website/            # Static website files
    ├── index.html
    ├── error.html
    ├── styles.css
    └── script.js
```

---

## ⚡️ Prerequisites

* Terraform v1.14.2+
* AWS account with sufficient permissions:

  * `S3FullAccess`
  * `CloudFrontFullAccess`
* AWS CLI configured (`aws configure`)

---

## 🛠 Deployment Steps

1. **Initialize Terraform**

```bash
terraform init
```

2. **Plan the deployment**

```bash
terraform plan -var-file="variables.tfvars"
```

3. **Apply the configuration**

```bash
terraform apply -var-file="variables.tfvars"
```

4. **Access the website**

* CloudFront URL: `https://<cloudfront_id>.cloudfront.net`

---

## 📓 Notes

* **Bucket is private**: direct S3 URL access will fail (403)
* **CloudFront caching**: first request may fetch from S3, subsequent requests served from edge locations
* **Content types**: HTML/CSS/JS files are automatically set to correct MIME type
* **Cache invalidation**: recommended when updating website files

---

## ⚙️ Optional Enhancements

* Custom domain + HTTPS via ACM
* Multi-environment deployments (Dev/Staging/Prod)
* CI/CD pipeline for automatic S3 uploads and CloudFront invalidation
* SPA routing support for React/Angular/Vue

---

## 📌 References

* [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
* [CloudFront Origin Access Control](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)

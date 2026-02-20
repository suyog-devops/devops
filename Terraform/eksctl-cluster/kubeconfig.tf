resource "null_resource" "generate_kubeconfig" {
  depends_on = [module.eks]

  provisioner "local-exec" {
    command = <<EOT
      aws eks update-kubeconfig \
        --region ${var.aws_region} \
        --name ${module.eks.cluster_name}
    EOT
  }
}

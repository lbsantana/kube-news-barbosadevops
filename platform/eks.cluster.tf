resource "aws_eks_cluster" "this" {
  name = var.eks_cluster.name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.eks_cluster.version
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids = data.aws_subnets.private.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSLocalOutpostClusterPolicy,
  ]
}

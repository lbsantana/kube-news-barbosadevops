resource "aws_iam_role" "eks_cluster" {
  name = "KubeNewsEKSClusterRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = [
            "eks.amazonaws.com",
          ]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSLocalOutpostClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLocalOutpostClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

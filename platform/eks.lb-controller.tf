resource "helm_release" "load_balanced_controller" {
  name       = "aws-load-balancer-controller"   # nome válido
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.13.0"
  namespace  = "kube-system"

  set = [
    {
      name  = "clusterName"
      value = aws_eks_cluster.this.name
    },
    {
      name  = "serviceAccount.create"
      value = "true"
    },
    {
      name  = "region"
      value = "us-east-2"
    },
    {
      name  = "vpcId"
      value = data.aws_vpc.this.id
    },
    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = aws_iam_role.load_balancer_controller_role.arn
    }
  ]
}

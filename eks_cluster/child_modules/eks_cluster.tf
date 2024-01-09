resource "aws_eks_cluster" "eks_cluster" {
    count = 1
    name = "eks_cluster"
    role_arn = aws_iam_role.EKSClusterRole.arn
    version = "1.27"

    vpc_config {
      subnet_ids = [aws_subnet.eks_pr_subnets[count.index].id, aws_subnet.eks_pub_subnets[count.index].id]
      security_group_ids = [aws_security_group.eks_sg.id]
    }

  #   tags = {
  #   "k8s.io/cluster-autoscaler/enabled"      = "true"
  #   "k8s.io/cluster-autoscaler/eks_cluster" = "owned"
  # }

    depends_on = [ aws_iam_role_policy_attachment.AmazonEKSClusterPolicy ]
  
}


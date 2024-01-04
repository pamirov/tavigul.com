resource "aws_eks_node_group" "eks_nodes" {
    count = 1
    cluster_name = aws_eks_cluster.eks_cluster[0].name
    node_group_name = "node_group"
    node_role_arn = aws_iam_role.NodeGroupRole.arn
    subnet_ids = [aws_subnet.eks_pr_subnets[count.index].id]

    scaling_config {
      desired_size = 1
      max_size = 2
      min_size = 1
    }

    ami_type = "AL2_x86_64"
    instance_types = ["t2.micro"]
    capacity_type = "ON_DEMAND"
    disk_size = 20

    depends_on = [ 
        aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
     ]

}
resource "aws_eks_node_group" "eks_nodes_spot" {
    count = 1
    cluster_name = aws_eks_cluster.eks_cluster[0].name
    node_group_name = "node_group_spot"
    node_role_arn = aws_iam_role.NodeGroupRole.arn
    subnet_ids = [aws_subnet.eks_pr_subnets[count.index].id]

    scaling_config {
      desired_size = 2
      max_size = 3
      min_size = 1
    }

    ami_type = "AL2_x86_64"
    instance_types = ["t3.micro"]
    capacity_type = "SPOT"
    disk_size = 30

    depends_on = [ 
        aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
     ]

}

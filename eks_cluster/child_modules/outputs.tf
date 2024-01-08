#Child module outputs 

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "pr_subnet_id" {
  value = aws_subnet.eks_pr_subnets[*].id
}

output "pub_subnet_id" {
  value = aws_subnet.eks_pub_subnets[*].id
}

output "igw" {
  value = aws_internet_gateway.igw[*].id
}

output "ngw" {
  value = aws_nat_gateway.nat_gw[*].id
}

output "route_table_id" {
  value = aws_route_table.rt_pub.id
}

output "nat_rt_id" {
  value = aws_route_table.rt_pr[*].id
}

output "nat_eip" {
  value = aws_eip.nat_eip[*].id
}

output "sg_id" {
  value = aws_security_group.eks_sg.id
}

output "eks_role_arn" {
  value = aws_iam_role.EKSClusterRole.arn
}

output "node_group_role" {
  value = aws_iam_role.NodeGroupRole.arn
}

output "oidc_arn" {
  value = aws_iam_openid_connect_provider.eks_oidc.arn
}

output "ca_iam_role_arn" {
  value = aws_iam_role.ca_iam_role.arn
}
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
  value = aws_internet_gateway.igw.id
}


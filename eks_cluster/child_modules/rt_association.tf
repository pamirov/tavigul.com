resource "aws_route_table_association" "eks_rt_as" {
    count = length(var.pub_cidr)
    subnet_id = aws_subnet.eks_pub_subnets[count.index].id
    route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "eks_rt_nat" {
  count          = length(var.pr_cidr)
  subnet_id      = aws_subnet.eks_pr_subnets[count.index].id
  route_table_id = aws_route_table.rt_pr[count.index].id
}

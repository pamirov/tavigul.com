resource "aws_route_table" "rt_pr" {
    count = length(var.azs)
    vpc_id = aws_vpc.eks_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat_gw[count.index].id
    }

    tags = {
        Name = "rt for nat gw"
    }
  
}

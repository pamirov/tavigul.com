resource "aws_eip" "nat_eip" {
  count = length(var.azs)
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_nat_gateway" "nat_gw" {
    count = length(var.pub_cidr)
    allocation_id = aws_eip.nat_eip[count.index].id
    subnet_id = aws_subnet.eks_pub_subnets[count.index].id

    tags = {
      Name = "eks_nat"
    }

    depends_on = [ aws_internet_gateway.igw ]
  
}


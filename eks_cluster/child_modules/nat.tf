resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat_gw" {
    count = 1
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.eks_pub_subnets[count.index].id

    tags = {
      Name = "eks_nat"
    }

    depends_on = [ aws_internet_gateway.igw ]
  
}


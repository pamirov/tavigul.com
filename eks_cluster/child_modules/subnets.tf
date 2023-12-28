resource "aws_subnet" "eks_pr_subnets" {
    count = length(var.pr_cidr)
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = var.pr_cidr[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = false

    tags = {
      Name = var.pr_cidr_tag[count.index]
    }
}

resource "aws_subnet" "eks_pub_subnets" {
    count = length(var.pub_cidr)
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = var.pub_cidr[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true
    
    tags = {
      Name = var.pub_cidr_tag[count.index]
    }
}


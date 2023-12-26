resource "aws_vpc" "eks_vpc" {
    cidr_block = var.cidr_vpc

    tags = {
      Name = "eks_vpc"
    }
}



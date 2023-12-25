#VPC - Subnets (priv and pub) - IGW - NGW - RT - RTA 


resource "aws_vpc" "cluster_vpc" {
    cidr_block = var.cidr_vpc
}



resource "aws_vpc" "cluster_vpc" {
    cidr_block = var.cidr_vpc
    
    tags = {
      Name = "cluster_vpc"
    }
}


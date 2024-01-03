resource "aws_security_group" "eks_sg" {
    name = "eks-sg"
    description = "security group for eks cluster"
    vpc_id = aws_vpc.eks_vpc.id
  
}

resource "aws_security_group_rule" "eks_rule_https" {
    type = "ingress"
    description = "Allow HTTPS"
    from_port = 443
    to_port = 443 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.eks_sg.id
  
}

resource "aws_security_group_rule" "eks_rule_http" {
    type = "ingress"
    description = "Allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.eks_sg.id
  
}

resource "aws_security_group_rule" "eks_rule_all" {
    type = "egress"
    description = "Allow all"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.eks_sg.id
  
}


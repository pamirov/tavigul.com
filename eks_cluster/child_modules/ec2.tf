# resource "aws_instance" "ec2" {
#     count = 1
#     ami = "ami-079db87dc4c10ac91"
#     instance_type = "t2.micro"
#     associate_public_ip_address = true
#     subnet_id = aws_subnet.eks_pub_subnets[count.index].id

#     tags = {
#         Name = "ec2_test_tf"
#     }
  
# }


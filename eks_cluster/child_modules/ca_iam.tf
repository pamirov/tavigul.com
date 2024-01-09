resource "aws_iam_policy" "ca_iam_policy" {
    name = "ca_iam_policy"
    path = "/"
    description = "IAM policy for Cluster Autoscaler"

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
      {
          Action = [
              "autoscaling:DescribeAutoScalingGroups",
              "autoscaling:DescribeAutoScalingInstances",
              "autoscaling:DescribeLaunchConfigurations",
              "autoscaling:DescribeTags",
              "autoscaling:SetDesiredCapacity",
              "autoscaling:TerminateInstanceInAutoScalingGroup",
              "ec2:DescribeLaunchTemplateVersions"
          ],
          Resource = "*",
          Effect = "Allow"
      },
  ]
    })
  
}

resource "aws_iam_role" "ca_iam_role" {
    name = "ca_iam_role"
    assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
    {
      Effect = "Allow",
      Action = "sts:AssumeRoleWithWebIdentity",
      Principal = {
        Federated = "arn:aws:iam::${var.aws_account_id}:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/FCF571B8350D9587EF7B3009AC191D66"
      },
      Condition = {
        StringEquals = {
          "oidc.eks.us-east-1.amazonaws.com/id/FCF571B8350D9587EF7B3009AC191D66:aud" = "sts.amazonaws.com"
          "oidc.eks.us-east-1.amazonaws.com/id/FCF571B8350D9587EF7B3009AC191D66:sub" = "system:serviceaccount:kube-system:cluster-autoscaler"
        }
      }
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "ca_iam_attachment" {
    role = aws_iam_role.ca_iam_role.name
    policy_arn = aws_iam_policy.ca_iam_policy.arn
  
}

#Additional Permissions

# data "aws_iam_policy" "capolicy" {
#   arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  
# }

# resource "aws_iam_role" "carole" {
#   name = "carole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "carole_attach" {
#   role = aws_iam_role.carole.name
#   policy_arn = aws_iam_policy.ca_iam_policy.arn
  
# }


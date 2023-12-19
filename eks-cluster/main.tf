provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "github.com/pamirov/tavigul.com//eks-cluster/modules?ref=eks-cluster"
}


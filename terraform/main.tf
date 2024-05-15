provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "keeker-clstr"
  cluster_version = "1.29"
  subnets         = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghij012"]
  vpc_id          = "vpc-12345678"

  node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "m5.large"
    }
  }
}


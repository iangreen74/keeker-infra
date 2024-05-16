provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "keeker-clstr"
  cluster_version = "1.29"
  subnets         = ["subnet-042771f1827029d88", "subnet-0d3090b9f7bdb0530", "subnet-04d35295708eb8d8d"]
  vpc_id          = "vvpc-06b68af264b469c07"

  node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "m5.large"
    }
  }
}


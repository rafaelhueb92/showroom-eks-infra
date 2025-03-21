provider "aws" {
  region = var.aws_region

  # Default tags for all resources
  default_tags {
    tags = {
      Environment = "dev"
      Project     = "showroom-eks"
    }
  }
}

module "vpc" { 
  source = "./vpc"
  project_name = var.project_name
}

module "iam" { 
  source = "./iam"
}

module "dynamodb" {
  source = "./dynamodb"
}

module "parameter_vpc" { 
  source ="./parameter"
  name_parameter = "/vpc/${var.project_name}/id"
  value_parameter = module.vpc.vpc_id
}

module secrets { 
  source = "./secrets"
  secret_string = module.iam.iam_user_eks_admin_jsonencoded
  iam_user_name = module.iam.iam_user_eks_name

  depends_on = [
    module.iam
  ]

}
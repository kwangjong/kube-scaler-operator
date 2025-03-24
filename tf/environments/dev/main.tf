terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-states-443370681532"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

# Networking
module "networking" {
  source = "../../modules/networking"

  environment            = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

# IAM
module "iam" {
  source = "../../modules/iam"

  environment = var.environment
}

# EKS
module "eks" {
  source = "../../modules/eks"

  cluster_name          = "${var.environment}-cluster"
  vpc_id               = module.networking.vpc_id
  subnet_ids           = module.networking.private_subnet_ids
  node_instance_types  = var.node_instance_types
  node_desired_size    = var.node_desired_size
  node_max_size        = var.node_max_size
  node_min_size        = var.node_min_size
} 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.10.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "./vpc/infra"
  
  cidr_block = var.cidr_block
  availability_zones = var.availability_zones
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
  vpc_name = var.vpc_name
}

module "eks" {
  source = "./eks/infra"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids = module.vpc.private_subnet_ids
  node_groups = var.node_groups

  depends_on = [ module.vpc ]
}
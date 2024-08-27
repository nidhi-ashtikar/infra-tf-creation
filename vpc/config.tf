provider "aws" {
  region = var.region
}

module "vpc" {
  source = "git::https://github.com/nidhi-ashtikar/infra-tf-modules.git//vpc"
  cidr_block_vpc = var.cidr_block_vpc
  cidr_block_public_subnet1 = var.cidr_block_public_subnet1
  cidr_block_public_subnet2 = var.cidr_block_public_subnet2
}

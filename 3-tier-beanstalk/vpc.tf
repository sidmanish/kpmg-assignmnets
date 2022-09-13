module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = var.vpc_name
  cidr = var.vpcCidr
  azs = [var.zone1,var.zone2,var.zone3]
  public_subnets = [var.pubSub1Cidr,var.pubSub2Cidr,var.pubSub3Cidr]
  private_subnets = [var.privSub1Cidr,var.privSub2Cidr,var.privSub3Cidr]
  enable_nat_gateway = true
  single_nat_gateway = true 
  enable_dns_hostnames = true 
  enable_dns_support = true 
  tags = {
    Terraform = "true"
    Environment = "prod"
  }
  vpc_tags = {
    Name = var.vpc_name
  }
}
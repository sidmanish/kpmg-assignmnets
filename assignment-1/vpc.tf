# Creating VPC
resource "aws_vpc" "kpmg-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
tags = {
  Name = "KPMG-VPC"
}
}

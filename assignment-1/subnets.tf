# Creating 1st subnet for frontend 
resource "aws_subnet" "frontend-subnet-1" {
  vpc_id                  = "${aws_vpc.kpmg-vpc.id}"
  cidr_block              = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.zone1}"
tags = {
  Name = "frontend-subnet-1"
}
}
# Creating 2nd subnet for frontend 
resource "aws_subnet" "frontend-subnet-2" {
  vpc_id                  = "${aws_vpc.kpmg-vpc.id}"
  cidr_block              = "${var.subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.zone2}"
tags = {
  Name = "frontend-subnet-2"
}
}


# Creating 1st subnet for application
resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = "${aws_vpc.kpmg-vpc.id}"
  cidr_block              = "${var.subnet3_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "${var.zone1}"
tags = {
  Name = "application-subnet-1"
}
}
# Creating 2nd subnet for application
resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = "${aws_vpc.kpmg-vpc.id}"
  cidr_block             = "${var.subnet4_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "${var.zone2}"
tags = {
  Name = "application-subnet-2"
}
}
# Creating 1st private subnet for db
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = "${aws_vpc.kpmg-vpc.id}"
  cidr_block        = "${var.subnet5_cidr}"
  availability_zone = "${var.zone1}"
tags = {
  Name = "database-subnet-1"
}
}
# Creating 2nd private subnet for db
resource "aws_subnet" "database-subnet-2" {
  vpc_id            = "${aws_vpc.kpmg-vpc.id}"
  cidr_block        = "${var.subnet6_cidr}"
  availability_zone = "${var.zone2}"
tags = {
  Name = "database-subnet-2"
}
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "kpmg-gateway" {
  vpc_id = "${aws_vpc.kpmg-vpc.id}"
}
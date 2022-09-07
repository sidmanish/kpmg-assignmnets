# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demo-instance-1" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  key_name                    = "demo-key"
  vpc_security_group_ids      = ["${aws_security_group.frontend-sg.id}"]
  subnet_id                   = "${aws_subnet.frontend-subnet-1.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "demo-instance-1"
}
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demo-instance-2" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  key_name                    = "demo-key"
  vpc_security_group_ids      = ["${aws_security_group.frontend-sg.id}"]
  subnet_id                   = "${aws_subnet.frontend-subnet-1.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "demo-instance-2"
}
}
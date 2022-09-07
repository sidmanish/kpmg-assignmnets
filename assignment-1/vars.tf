# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "172.21.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "subnet1_cidr" {
  default = "172.21.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "subnet2_cidr" {
  default = "172.21.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet3_cidr" {
  default = "172.21.3.0/24"
}
# Defining CIDR Block for 4th Subnet
variable "subnet4_cidr" {
  default = "172.21.4.0/24"
}
# Defining CIDR Block for 5th Subnet
variable "subnet5_cidr" {
  default = "172.21.5.0/24"
}
# Defining CIDR Block for 6th Subnet
variable "subnet6_cidr" {
  default = "172.21.6.0/24" 
}

# variable for defining zone

variable "zone1"{
  default = "us-east-1a"
}

variable "zone2"{
  default = "us-east-1b"
}

variable "region"{
  default = "us-east-1"
}
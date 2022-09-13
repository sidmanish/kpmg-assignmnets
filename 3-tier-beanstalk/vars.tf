variable region {
  default = "us-east-1"
}

variable ami {
    default = "ami-05fa00d4c63e3237"
}

variable "private_key_path" {
    default = "kpmg-key"
}

variable "public_key_path" {
    default = "kpmg-key.pub"
}

variable username {
    default = "ubuntu"
}

variable myip {
    default = "103.204.37.243/32"
}

variable rmquser {
    default = "rabbit"

}

variable rmqpass {
    default = "admin123456789" 
}

variable dbuser {
    default = "admin"
}

variable dbpass {
    default = "admin123"
}

variable dbname {
    default = "accounts"
}

variable instance_count {
    default = "1"
}

variable vpc_name {
    default = "my-vpc"
}

variable zone1 {
    default = "us-east-1"
}

variable zone2 {
    default = "us-east-2"
}

variable zone3 {
    default = "us-east-3"
}

variable vpcCidr {
    default = "172.21.0.0/16"
}

variable pubSub1Cidr {
    default = "172.21.1.0/24"
}

variable pubSub2Cidr {
    default = "172.21.2.0/24"
}

variable pubSub3Cidr {
    default = "172.21.3.0/24"
}

variable privSub1Cidr {
    default = "172.21.4.0/24"
}

variable privSub2Cidr {
    default = "172.21.5.0/24"
}


variable privSub3Cidr {
    default = "172.21.6.0/24"
}


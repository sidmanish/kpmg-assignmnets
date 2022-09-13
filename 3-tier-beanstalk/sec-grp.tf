resource "aws_security_group" "kpmg-bean-elb-sg"{
    name = "kpmg-bean-elb-sg"
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]

    }

}

resource "aws_security_group" "kpmg-bastion-sg"{
    name = "kpmg-bastion-sg"
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = [var.myip]

    }

}

resource "aws_security_group" "kpmg-prod-sg"{
    name = "kpmg-prod-sg "
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.kpmg-bastion-sg.id]

    }

}

resource "aws_security_group" "kpmg-backend-sg"{
    name = "kpmg-backend-sg "
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        security_groups = [aws_security_group.kpmg-prod-sg.id]

    }

}

resource "aws_security_group_rule" "sec_group_allow_itself"{
    type = "ingress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_group_id = aws_security_group.kpmg-backend-sg.id
    source_security_group_id = aws_security_group.kpmg-backend-sg.id

}
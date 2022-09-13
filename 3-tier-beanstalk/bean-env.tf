resource "aws_elastic_beanstalk_environment" "kpmg-bean-prod" {
    name = "kpmg-bean-prod"
    application = aws_elastic_beanstalk_application.kpmg-prod.name
    solution_stack_name = "64bit Amazon Linux 2 v4.2.18 running Tomcat 8.5 Corretto 11"
    cname_prefix = "kpmg-bean-prod-domain9075"

    setting {
        namespace = "aws:ec2:VPC"
        name = "VPCId"
        value = module.vpc.vpc_id
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "IamInstanceProfile"
        value = "aws-elasticbeanstalk-ec2-role"
    }
    setting {
        namespace = "aws:ec2:VPC"
        name = "AssociatePublicIpAddress"
        value = "false"
    }

    setting {
        namespace = "aws:ec2:VPC"
        name = "Subnets"
        value = join(",", [module.vpc.private_subnets[0],module.vpc.private_subnets[1],module.vpc.private_subnets[2]])

    }

    setting {
        namespace = "aws:ec2:VPC"
        name = "ELBSubnets"
        value = join(",", [module.vpc.public_subnets[0],module.vpc.public_subnets[1],module.vpc.public_subnets[2]])
        
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "InstanceType"
        value = "t2.micro"
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "Ec2KeyName"
        value = "demo-key"
    }

    setting {
        namespace = "aws:autoscaling:asg"
        name = "Availability Zones"
        value = "Any 3"
    }

    setting {
        namespace = "aws:autoscaling:asg"
        name = "Minsize"
        value = "1"
    }

    setting {
        namespace = "aws:autoscaling:asg"
        name = "Maxsize"
        value = "2"
    }

     setting {
        namespace = "aws:elasticbeanstalk:application:environment"
        name = "environment"
        value = "prod"
    }

    setting {
        namespace = "aws:elasticbeanstalk:application:environment"
        name = "LOGGING_APPENDER"
        value = "GRAYLOG"
    }

    setting {
        namespace = "aws:elasticbeanstalk:healthreporting:system"
        name = "SystemType"
        value = "enhanced"
    }

     setting {
        namespace = "aws:autoscaling:updatepolicy:rollingupdate"
        name = "RollingUpdateEnabled"
        value = "true"
    }

    setting {
        namespace = "aws:autoscaling:updatepolicy:rollingupdate"
        name = "RollingUpdateType"
        value = "Health"
    }

    setting {
        namespace = "aws:autoscaling:updatepolicy:rollingupdate"
        name = "MaxBatchSize"
        value = "1"
    }

    setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
    }

    setting {
        name      = "StickinessEnabled"
        namespace = "aws:elasticbeanstalk:environment:process:default"
        value     = "true"
    }

    setting {
        namespace = "aws:elasticbeanstalk:command"
        name      = "BatchSizeType"
        value     = "Fixed"
    }

    setting {
        namespace = "aws:elasticbeanstalk:command"
        name      = "BatchSize"
        value     = "1"
    }
    setting {
        namespace = "aws:elasticbeanstalk:command"
        name      = "DeploymentPolicy"
        value     = "Rolling"
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "SecurityGroups"
        value     = aws_security_group.kpmg-prod-sg.id
    }

    setting {
        namespace = "aws:elbv2:loadbalancer"
        name      = "SecurityGroups"
        value     = aws_security_group.kpmg-bean-elb-sg.id
    }

    depends_on = [aws_security_group.kpmg-bean-elb-sg, aws_security_group.kpmg-prod-sg]

}

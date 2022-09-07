# Creating External LoadBalancer
resource "aws_lb" "external-alb" {
  name               = "external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.frontend-sg.id]
  subnets            = [aws_subnet.frontend-subnet-1.id, aws_subnet.frontend-subnet-2.id]
}
resource "aws_lb_target_group" "target-elb" {
  name     = "target-elb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.kpmg-vpc.id
}
resource "aws_lb_target_group_attachment" "attachment-1" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.demo-instance-1.id
  port             = 80
depends_on = [
  aws_instance.demo-instance-1,
]
}
resource "aws_lb_target_group_attachment" "attachment-2" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.demo-instance-2.id
  port             = 80
depends_on = [
  aws_instance.demo-instance-2,
]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.target-elb.arn
}
}
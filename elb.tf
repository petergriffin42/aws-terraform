resource "aws_elb" "elb" {
  name               = "elb"
#  availability_zones = distinct(flatten([for subnet in local.subnet_list : [lookup(subnet, "az", var.default_aws_az)]]))
  security_groups    = [aws_security_group.allow_80.id,aws_security_group.allow_443.id]
  subnets            = [for id in aws_subnet.public_subnets : id.id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  listener {
    instance_port     = 443
    instance_protocol = "HTTPS"
    lb_port           = 443
    lb_protocol       = "HTTPS"
    ssl_certificate_id = aws_acm_certificate.elb_ssl.id
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "aws_elb"
  }
}

resource "aws_acm_certificate" "elb_ssl" {
  domain_name       = "elb.griffin-resume.com"
  validation_method = "DNS"

  tags = {
    Name = "elb-ssl-cert"
  }
}
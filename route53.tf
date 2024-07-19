resource "aws_route53_zone" "griffin" {
  name = "griffin-resume.com"
}

resource "aws_route53_record" "elb" {
  zone_id = aws_route53_zone.griffin.zone_id
  name    = "elb.griffin-resume.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_elb.elb.dns_name]
}
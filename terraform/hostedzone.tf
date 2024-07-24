# prod hosted zone
resource "aws_route53_zone" "main" {
  name = "auratest.dev"
  tags = {
    Name        = "aura"
    Environment = "prod"
  }
}

# resource "aws_route53_record" "wildcard" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "*.auratest.dev"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_eip.ec2_eip.public_ip]
# }

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "auratest.dev"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.ec2_eip.public_ip]
}
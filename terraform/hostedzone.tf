# prod hosted zone
resource "aws_route53_zone" "main" {
  name = "auratest.dev"
  tags = {
    Name        = "aura"
    Environment = "prod"
  }
}

resource "aws_route53_record" "wildcard" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "*.auratest.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.main.name_servers
}
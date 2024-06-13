resource "aws_route53_zone" "primary" {
  name = "auratest.dev"
  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}
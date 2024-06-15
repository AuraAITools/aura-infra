resource "aws_ecr_repository" "aura_container_registry" {
  name                 = "aura"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}
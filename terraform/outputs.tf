output "ecr_registry" {
  value = aws_ecr_repository.aura_container_registry.repository_url
}
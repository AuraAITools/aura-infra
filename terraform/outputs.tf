
output "secret" {
  value = aws_iam_access_key.ecr_svc_user.secret
  sensitive = false
}

output "key_id" {
  value = aws_iam_access_key.ecr_svc_user.id
  sensitive = false
}
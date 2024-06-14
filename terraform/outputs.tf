
output "secret" {
  value = aws_iam_access_key.ecr_svc_user.secret
}

output "key_id" {
  value = aws_iam_access_key.ecr_svc_user.id
}
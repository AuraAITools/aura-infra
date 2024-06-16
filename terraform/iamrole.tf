resource "aws_iam_role" "ecr_svc_user" {
  name = "ecr_svc_user"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ecr.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [data.aws_iam_policy.ecr_push_pull_policy.arn]
}
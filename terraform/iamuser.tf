resource "aws_iam_user" "ecr_svc_user" {
  name = "ecr_svc_user"
  path = "/system/"

  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}
resource "aws_iam_user" "ecr_user" {
  name = "ecr_user"
  path = "/system/"

  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}
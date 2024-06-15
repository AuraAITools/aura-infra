data "aws_iam_policy" "ecr_push_pull_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
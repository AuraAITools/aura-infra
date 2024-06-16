resource "aws_iam_group" "devops" {
  name = "devops_group"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "devops_policy_attachment" {
  group      = aws_iam_group.devops.name
  policy_arn = data.aws_iam_policy.ecr_push_pull_policy.arn
}

// ecr service user deployer's user group membership
resource "aws_iam_user_group_membership" "ecr_user_membership" {
  user = aws_iam_user.ecr_user.name

  groups = [
    aws_iam_group.devops.name
  ]
}
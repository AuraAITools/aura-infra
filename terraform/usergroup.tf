resource "aws_iam_group" "deployer_svc_group" {
  name = "deployer_svc"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "deployer_svc_group_policy_attachment" {
  group      = aws_iam_group.deployer_svc_group.name
  policy_arn = data.aws_iam_policy.ecr_push_pull_policy.arn
}

// ecr service user deployer's user group membership
resource "aws_iam_user_group_membership" "ecr_svc_user_membership" {
  user = aws_iam_user.ecr_svc_user.name

  groups = [
    aws_iam_group.deployer_svc_group.name
  ]
}
resource "aws_iam_user" "ecr_svc_user" {
  name = "ecr_svc_user"
  path = "/system/"

  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}

resource "aws_iam_access_key" "ecr_svc_user" {
  user = aws_iam_user.ecr_svc_user.name
}

data "aws_iam_policy_document" "ecr_policy" {
  statement {
    effect = "Allow"
    actions = ["ecr:*",
    "cloudtrail:LookupEvents"]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ecr_user_policy" {
  name   = "ecr_user_policy"
  user   = aws_iam_user.ecr_svc_user.name
  policy = data.aws_iam_policy_document.ecr_policy.json
}
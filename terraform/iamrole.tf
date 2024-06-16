resource "aws_iam_role" "ecr_svc_user" {
  name               = "ecr_svc_user"
  assume_role_policy = "${data.aws_iam_policy.ecr_push_pull_policy}"
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name = each.value
}

resource "aws_iam_policy" "cloudwatch_read_only" {
  description = "This policy provides read only access to Cloudwatch"
  name = "cloudwatch_read_only"
  policy = "data.aws_iam_policy_document.cloudwatch_read_only.json"
}

resource "aws_iam_policy_attachment" "neo_cloudwatch_read_only" {
  count = var.give_neo_cloudwatch_full_access ? 0 : 1
  
  users = aws_iam_user.example[0].name
  policy_arn = aws_iam_policy.cloudwatch_full_access.arn
}

resource "aws_iam_policy" "cloudwatch_full_access" {
  description = "This policy provides full access to Cloudwatch"
  name = "cloudwatch_full_access"
  policy = "data.aws_iam_policy_document.cloudwatch_full_access.json"
}

resource "aws_iam_policy_attachment" "neo_cloudwatch_full_access" {
  count = var.give_neo_cloudwatch_full_access ? 1 : 0

  users = aws_iam_user.example[0].name
  policy_arn = aws_iam_policy.cloudwatch_full_access.arn
}
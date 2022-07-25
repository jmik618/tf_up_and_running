output "all_users" {
  value = aws_iam_user.example
  description = "The ARNs for all users"
}

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}
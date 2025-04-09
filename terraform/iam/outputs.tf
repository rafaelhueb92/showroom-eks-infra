output "iam_user_eks_admin_jsonencoded" {
  description = "Access for the eks admin"
  value       = jsonencode({
    access_key = aws_iam_access_key.this.id
    secret_key = aws_iam_access_key.this.secret
  })
}

output "iam_user_eks_name" { 
    value = aws_iam_user.this.name
}

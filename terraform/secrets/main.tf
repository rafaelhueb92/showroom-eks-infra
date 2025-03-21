resource "aws_secretsmanager_secret" "iam_secret" {
  name = "${var.iam_user_name}-credentials"
}

resource "aws_secretsmanager_secret_version" "iam_secret_version" {
  secret_id     = aws_secretsmanager_secret.iam_secret.id
  secret_string = var.secret_string
}
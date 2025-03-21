resource "aws_iam_user" "this" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

data "aws_iam_policy_document" "eks" {
  statement {
    effect    = "Allow"
    actions   = ["eks:*"]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["iam:*"]
    resources = ["*"]
  }
  statement { 
    effect = "Allow"
    actions = ["s3:*"]
    resources = ["*"]  
  }

}

resource "aws_iam_user_policy" "this" {
  name   = "eks-admin-policy"
  user   = aws_iam_user.this.name
  policy = data.aws_iam_policy_document.eks.json
}

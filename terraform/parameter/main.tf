resource "aws_ssm_parameter" "foo" {
  name  = var.name_parameter
  type  = "String"
  value = var.value_parameter
}
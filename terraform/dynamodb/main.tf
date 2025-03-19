resource "aws_dynamodb_table" "tb_user" {
  name           = "tb_user"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "app_id"
  range_key      = "email"

  attribute {
    name = "app_id"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

}

resource "aws_dynamodb_table" "tb_app" {
  name           = "tb_app_metric_car"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "app_id"
  range_key      = "email"

  attribute {
    name = "app_id"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

}
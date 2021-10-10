resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = var.dynamodbtable_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = var.global_tags
}

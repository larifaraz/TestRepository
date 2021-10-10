output "DDBTable_arn" {
    value = aws_dynamodb_table.basic-dynamodb-table.*.arn
}
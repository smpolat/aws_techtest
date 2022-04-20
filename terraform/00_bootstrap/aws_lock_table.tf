resource "aws_dynamodb_table" "tf_lock" {
  name           = "${local.prefix}-tf_lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3

  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "wordpress" {
  bucket_prefix = "interviewuser1-app-bucket"
}

resource "aws_s3_bucket_acl" "wordpress" {
  bucket = aws_s3_bucket.wordpress.bucket
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "wordpress" {
  bucket = aws_s3_bucket.wordpress.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.wordpress.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

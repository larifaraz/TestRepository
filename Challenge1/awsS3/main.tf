resource "aws_s3_bucket" "bucket" {
  count  = length(var.bucket_name)
  bucket = element(var.bucket_name, count.index)
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = var.global_tags
}

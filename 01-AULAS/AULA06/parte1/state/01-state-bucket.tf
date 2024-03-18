resource "aws_s3_bucket" "state_bucket" {
  bucket = "trfm-state-bucket-abs"

  force_destroy = true # em producao deve ser false
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
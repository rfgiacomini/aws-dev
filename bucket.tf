resource "aws_s3_bucket" "bucket-s3-version" {
  bucket = "buckets3-versionador"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket-s3-version.id
  versioning_configuration {
    status = "Enabled"
  }
}
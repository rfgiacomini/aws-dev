resource "aws_s3_bucket" "teste_initial" {
  bucket = "test-initial"

  tags = {
    Name        = "test-initial"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "state_bucket" {
  bucket        = "${local.prefix}-state"
  force_destroy = true
}

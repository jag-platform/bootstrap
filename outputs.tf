output "state_bucket_name" {
  description = "Name of the S3 bucket that stores the Terraform remote state"
  value       = aws_s3_bucket.state_bucket.bucket
}

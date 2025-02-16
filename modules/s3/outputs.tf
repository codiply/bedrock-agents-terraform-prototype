output "restaurant_descriptions_bucket_name" {
  value = aws_s3_bucket.restaurant_descriptions.bucket
  description = "Name of bucket holding the restaurant descriptions"
}

output "restaurant_descriptions_bucket_arn" {
  value = aws_s3_bucket.restaurant_descriptions.arn
  description = "ARN of bucket holding the restaurant descriptions"
}
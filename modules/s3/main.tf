resource "aws_s3_bucket" "restaurant_descriptions" {
  bucket = "${var.name_prefix}-${local.account_id}-${local.region_name}"
  force_destroy = true
} 

resource "aws_s3_object" "restaurant_description" {
  for_each = fileset("${path.root}/data/restaurants/", "**/*")

  bucket = aws_s3_bucket.restaurant_descriptions.id
  key    = "${each.value}"
  source = "${path.root}/data/restaurants/${each.value}"

  etag = filemd5("${path.root}/data/restaurants/${each.value}")
}

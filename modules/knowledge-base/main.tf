resource "aws_iam_role" "knowledge_base_restaurant_descriptions" {
  name = "${var.name_prefix}-knowledge-base-restaurant-descriptions"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "bedrock.amazonaws.com"
        }
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = local.account_id
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:bedrock:${local.region_name}:${local.account_id}:knowledge-base/*"
          }
        }
      }
    ]
  }
  )  
}

resource "aws_iam_role_policy" "knowledge_base_restaurant_descriptions_invoke_embedding_model" {
  role = aws_iam_role.knowledge_base_restaurant_descriptions.name
  policy = jsonencode({
    Statement = [
      {
        Action   = "bedrock:InvokeModel"
        Effect   = "Allow"
        Resource = local.embedding_model_arn
      }
    ]
  })
}

resource "aws_iam_role_policy" "knowledge_base_restaurant_descriptions_access_s3" {
  role = aws_iam_role.knowledge_base_restaurant_descriptions.name
  policy = jsonencode({
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = [var.s3_bucket_arn, "${var.s3_bucket_arn}/restaurants-v2/*"]
      }
    ]
  })

}

resource "aws_iam_role_policy" "knowledge_base_restaurant_descriptions_access_aoss_api" {
  role = aws_iam_role.knowledge_base_restaurant_descriptions.name
  policy = jsonencode({
    Statement = [
      {
        Action   = ["aoss:APIAccessAll"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# resource "aws_bedrockagent_knowledge_base" "restaurant_descriptions" {


# }
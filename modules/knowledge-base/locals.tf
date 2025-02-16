locals {
  account_id = data.aws_caller_identity.this.account_id
  region_name = data.aws_region.this.name
  embedding_model_arn = "arn:aws:bedrock:${local.region_name}::foundation-model/${var.embedding_model_id}"
}
module "s3" {
  source      = "./modules/s3"
  name_prefix = var.name_prefix
}

module "knowledge_base" {
  source      = "./modules/knowledge-base/"
  name_prefix = var.name_prefix
  embedding_model_id = var.knowledge_base_embedding_model_id
  s3_bucket_name = module.s3.restaurant_descriptions_bucket_name
  s3_bucket_arn = module.s3.restaurant_descriptions_bucket_arn
}
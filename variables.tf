variable "name_prefix" {
  type        = string
  description = "Prefix for object names created in this module"
}

variable "knowledge_base_embedding_model_id" {
  type = string
  description = "Model id of foundation model to be used in creating embeddings for the knowledge base"
}
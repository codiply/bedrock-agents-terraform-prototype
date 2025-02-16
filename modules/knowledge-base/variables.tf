variable "name_prefix" {
  type = string
  description = "Prefix for object names created in this module"
}

variable "embedding_model_id" {
  type = string
  description = "The model_id of the foundation model to be used to create the embeddings"
}

variable "s3_bucket_name" { 
  type = string
  description = "The name of the bucket where the restaurant descriptions are stored"
}

variable "s3_bucket_arn" { 
  type = string
  description = "The ARN of the bucket where the restaurant descriptions are stored"
}
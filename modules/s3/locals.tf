locals {
  account_id = data.aws_caller_identity.this.account_id
  region_name = data.aws_region.this.name
}
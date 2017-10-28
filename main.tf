//
// Module: tf-aws-s3-state
//
//
provider "aws" {
  region = "${var.aws_region}"
}



# Create an S3 state bucket
module "terraform_state_bucket" {
  source = "git::https:/github.com/bmacauley/tf-aws-s3//?ref=v0.1"
  region            = "${var.region}"
  bucket            = "${var.bucket}"
  bucket_suffix     = "${var.bucket_suffix}"
  random_id_suffix_enable = "${var.random_id_suffix_enable}"
  acl               = "private"
  enable_versioning = true
  force_destroy     = "${var.force_destroy}"
  common_tags       = "${var.common_tags}"
  other_tags        = "${var.other_tags}"
  prevent_destroy   = "${var.prevent_destroy}"
}



# Create a DynamoDB state lock table
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${module.terraform_state_bucket.id}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

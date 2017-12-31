//
// Module: tf-aws-s3-state
//
//
provider "aws" {
  region = "${var.aws_region}"
}


# Create an S3 state bucket
module "terraform_state_bucket" {
  source = "github.com/bmacauley/tf-aws-s3//?ref=v0.2"
  region            = "${var.region}"
  bucket            = "${var.bucket}"
  acl               = "${var.acl}"
  sse_algorithm     = "${var.sse_algorithm}"
  bucket_suffix     = "${var.bucket_suffix}"
  enable_random_id_suffix = "${var.enable_random_id_suffix}"
  enable_versioning = "${var.enable_versioning}"
  force_destroy     = "${var.force_destroy}"
  prevent_destroy   = "${var.prevent_destroy}"
  common_tags       = "${var.common_tags}"
  other_tags        = "${var.other_tags}"
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

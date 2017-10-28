//
// Module: tf-aws-s3-state
//
//  Variables
//
//
//
# aws_s3_bucket - terraform docs
# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html




# Required
# --------

variable "aws_region" {
  default = "eu-west-1"
}

# Optional
# --------

# The name of the state bucket. If omitted, Terraform will assign a random, unique name.
variable "bucket" {
  default = "tfstate"
}


# If specified, the AWS region this state bucket should reside in.
# Otherwise, the region used by the callee
variable "region" {
  default = "eu-west-1"
}


# bucket suffix
variable "bucket_suffix" {
  default = "terraform"
}

# enable random_id suffix
# eg tfstate-de48g5
variable "random_id_suffix_enable" {
  default = 1
}


# A boolean that indicates all objects should be deleted from the
# bucket so that the bucket can be destroyed without error
variable "force_destroy" {
  default = false
}


# Set common tags on the state bucket
variable "common_tags" {
  default = {
    created_by   = "terraform"
    project_id   = ""
    project_name = ""
    environment  = ""
    component    = ""
  }
}

variable "other_tags" {
  default = {}
}

#Terraform lifecycle rule to prevent the removal of a bucket during a destroy
variable "prevent_destroy" {
  default = false
}

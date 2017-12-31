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

variable "bucket" {
  description = "The name of the state bucket. If omitted, Terraform will assign a random, unique name"
  default = ""
}


# If specified, the AWS region this state bucket should reside in.
# Otherwise, the region used by the callee
variable "region" {
  description = "If specified, the AWS region this state bucket should reside in. Otherwise, the region used by the callee"
  default = "eu-west-1"
}

variable "acl" {
  description = "Set canned ACL on bucket. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write"
  default     = "private"
}

# bucket suffix
variable "bucket_suffix" {
  description = "enable bucket name suffix eg my-bucket-suffix"
  default = ""
}

# enable random_id suffix
# eg tfstate-de48g5
variable "enable_random_id_suffix" {
  description = "enable random_id suffix on bucket name eg my-bucket-de48g5"
  default = false
}

#Terraform lifecycle rule to prevent the removal of a bucket during a destroy
variable "prevent_destroy" {
  description = "terraform lifecycle rule to prevent the removal of a bucket during a terraform destroy"
  default = true
}

# A boolean that indicates all objects should be deleted from the
# bucket so that the bucket can be destroyed without error
variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default = false
}

variable "enable_versioning" {
  description = "Enable versioning on the bucket"
  default     = true
}

# Set common tags on the state bucket
variable "common_tags" {
  description = "common tags for bucket"
  type = "map"
  default = {
    terraform   = "true"
    project_id   = ""
    project_name = ""
    environment  = ""
    component    = ""
  }
}

variable "other_tags" {
  description = "other tags for bucket"
  type = "map"
  default = {}
}

# Default server side encryption configuration
variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  default = "AES256"
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms"
  default = ""
}

# lifecycle rule - abort multi-part uploads
variable "enable_abort_incomplete_multipart_upload" {
  description = "Lifecycle rule to abort incomplete multi-part uploads after a certain time"
  default = false
}

variable "abort_incomplete_multipart_upload_days" {
  description = "No. of days to wait before aborting incomplete multi-part uploads"
  default = "7"
}

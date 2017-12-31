//
// Module: tf-aws-state
//
//
// Outputs
//


output "state_bucket_id" {
  description = "The name of the state bucket"
  value = "${module.terraform_state_bucket.id}"
}


output "state_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value = "${module.terraform_state_bucket.arn}"
}


output "state_bucket_region" {
  description = "The AWS region this bucket resides in"
  value = "${module.terraform_state_bucket.region}"
}


output "state_lock_table_id" {
  description = "DynamoDB state lock table name"
  value = "${aws_dynamodb_table.terraform_state_lock.id}"
}


output "state_lock_table_arn" {
  description = "DynamoDB state lock table arn"
  value = "${aws_dynamodb_table.terraform_state_lock.arn}"
}

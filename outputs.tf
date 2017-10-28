//
// Module: tf-aws-state
//
//
// Outputs
//

output "state_bucket_id" {
   value = "${module.terraform_state_bucket.id}"
}

# The ARN of the bucket. Will be of format arn:aws:s3:::bucketname
output "state_bucket_arn" {
   value = "${module.terraform_state_bucket.arn}"
}

# The AWS region this bucket resides in
output "state_bucket_region" {
   value = "${module.terraform_state_bucket.region}"
}

# DynamoDB state lock table name
output "state_lock_table_id" {
   value = "${aws_dynamodb_table.terraform_state_lock.id}"
}


# DynamoDB state lock table arn
output "state_lock_table_arn" {
   value = "${aws_dynamodb_table.terraform_state_lock.arn}"
}

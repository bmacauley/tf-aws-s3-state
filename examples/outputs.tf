# # The name of the bucket.
output "state_bucket_id" {
   value = "${module.my_state_backend.state_bucket_id}"
}

# The ARN of the bucket. Will be of format arn:aws:s3:::bucketname
output "state_bucket_arn" {
   value = "${module.my_state_backend.state_bucket_arn}"
}


# The AWS region this bucket resides in
output "state_bucket_region" {
   value = "${module.my_state_backend.state_bucket_region}"
}


# DynamoDB state lock table name
output "state_lock_table_id" {
   value = "${module.my_state_backend.state_lock_table_id}"
}

# DynamoDB state lock table arn
output "state_lock_table_arn" {
   value = "${module.my_state_backend.state_lock_table_arn}"
}

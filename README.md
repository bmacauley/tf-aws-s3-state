# tf-aws-s3-state terraform module

Terraform module to create s3 state bucket and dynamodb lock table.
Uses tf-aws-s3 with preset defaults to minimise config

## Features
* create a state bucket
* bucket suffix
* random_id suffix
* set default encryption, AES256
* Set ACL as 'private'
* Enable versioning
* Create a DynamoDB lock table with the same name as state bucket


## Dependencies
* [bmacauley/tf-aws-s3](https://github.com/bmacauley/tf-aws-s3)



## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| abort_incomplete_multipart_upload_days | No. of days to wait before aborting incomplete multi-part uploads | string | `7` | no |
| acl | Set canned ACL on bucket. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write | string | `private` | no |
| aws_region |  | string | `eu-west-1` | no |
| bucket | The name of the state bucket. If omitted, Terraform will assign a random, unique name | string | `` | no |
| bucket_suffix | enable bucket name suffix eg my-bucket-suffix | string | `` | no |
| common_tags | common tags for bucket | map | `<map>` | no |
| enable_abort_incomplete_multipart_upload | Lifecycle rule to abort incomplete multi-part uploads after a certain time | string | `false` | no |
| enable_random_id_suffix | enable random_id suffix on bucket name eg my-bucket-de48g5 | string | `false` | no |
| enable_versioning | Enable versioning on the bucket | string | `true` | no |
| force_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error | string | `false` | no |
| kms_master_key_id | The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms | string | `` | no |
| other_tags | other tags for bucket | map | `<map>` | no |
| prevent_destroy | terraform lifecycle rule to prevent the removal of a bucket during a terraform destroy | string | `true` | no |
| region | If specified, the AWS region this state bucket should reside in. Otherwise, the region used by the callee | string | `eu-west-1` | no |
| sse_algorithm | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | string | `AES256` | no |


## Outputs
| Name | Description |
|------|-------------|
| state_bucket_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| state_bucket_id | The name of the state bucket |
| state_bucket_region | The AWS region this bucket resides in |
| state_lock_table_arn | DynamoDB state lock table arn |
| state_lock_table_id | DynamoDB state lock table name |


## Usage
```
module "my_state_backend" {
  source            = "github.com/bmacauley/tf-aws-s3-state//"
  bucket            = "p000123-tfstate"
  bucket_suffix            = "example-com"
  enable_random_id_suffix = true
  common_tags  = {
    terraform     =  "true"
    project_id    =  "p000123"
    project_name  =  "test"
    environment   =  "sbx"
    component     =  "tf-state-bucket"
  }
}
```


## Examples
[create state bucket](/examples/create_state_bucket)


## Authors
* [Brian Macauley](https://github.com/bmacauley) &lt;brian.macauley@gmail.com&gt;

## License
[MIT](/LICENSE)

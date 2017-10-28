# tf-aws-state terraform module
terraform module to create s3 state bucket and dynamodb lock table

## Features
* create a state bucket
* bucket suffix
* random_id suffix
* set bucket policy for encryption
* Set ACL as 'private'
* Enable versioning
* Create a DynamoDB lock table with the same name as state bucket


## Dependencies
* [bmacauley/tf-aws-s3](https://github.com/bmacauley/tf-aws-s3)



## Inputs
#### Required


#### Optional
* `bucket` - (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.
* `region` - (Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee.
* `bucket_suffix` - Add a bucket suffix to the bucket name. eg bucketname-suffix bucket_suffix = "" disables the feature
* `random_id_suffix_enable` - enable/disable random_id_suffix feature eg bucketname-d56gx7 or bucketname-suffix-d56gx7
* `enable_versioning` - Enable versioning on the bucket
* `force_destroy` - A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error
* `common_tags` - Set Deloitte Cloud common tags on the bucket
* `other_tags` - Set any other tags that are required
* `prevent_destroy` - Terraform lifecycle rule to prevent the removal of a bucket during a destroy


## Usage
```
module "my_state_backend" {
  source            = "github.com/bmacauley/tf-aws-s3-state//"
  bucket            = "p000123-tfstate"
  bucket_suffix     = "bm-uk"
  random_id_suffix_enable = 1
  common_tags  = {
    "created_by"   =  "terraform"
    "project_id"   =  "p000123"
    "project_name" =  "test"
    "environment"  =  "dev"
    "component"    =  "bucket"

  }

}
```



## Outputs
* `state_bucket_id` - The name of the state bucket
* `state_bucket_arn` - The ARN of the bucket. Will be of format arn:aws:s3:::bucketname
* `state_bucket_region` - The AWS region this bucket resides in
* `state_lock_table_id` - DynamoDB state lock table name
* `state_lock_table_arn` - DynamoDB state lock table arn

## Authors
* [Brian Macauley](https://github.com/bmacauley) &lt;brian.macauley@gmail.com&gt;

## License
[MIT](/LICENSE)

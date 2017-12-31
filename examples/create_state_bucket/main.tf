# Create a local state backend
terraform {
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}


# Create a bucket
module "my_state_backend" {
  source                  = "../../"
  bucket                  = "p000123-tfstate"
  bucket_suffix           = "example-com"
  enable_random_id_suffix = true

  common_tags  = {
    terraform   =  "true"
    project_id   =  "p000123"
    project_name =  "test"
    environment  =  "sbx"
    component    =  "bucket"
  }

}

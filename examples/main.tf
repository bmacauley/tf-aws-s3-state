# Create a local state backend
terraform {
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}


# Create a bucket
module "my_state_backend" {
  source            = "../"
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
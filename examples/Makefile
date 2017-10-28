#--------------------------
# tf-aws-s3-state example
#--------------------------


init:
	terraform init

plan: init
	terraform plan -lock=false -out=./.terraform/terraform.tfplan

apply: init
	terraform apply -lock=false

outputs:
	terraform outputs

destroy:
	terraform destroy -lock=false

clean:
	rm -rf .terraform

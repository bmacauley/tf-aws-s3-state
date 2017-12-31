S3 state bucket
=========

Configuration in this directory creates an S3 state bucket for Terraform

Usage
=====
Before you run this example, the user should be logged into AWS with an IAM role that has enough permissions to create the resources. The preferred method is to the Okta assume role login too(secret access key/access key id approaches are discouraged for security reasons)

To run this example you need to excecute:

```bash
$ make init
$ make plan
$ make apply

To clean up...
$ make destroy
$ make clean
```

Note that this example may create resources which can cost money (S3 bucket). Run `make destroy` when you don't need these resources.

terraform {
   backend "s3" {
     bucket = "udacity-tf-galal-us-west-1"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }

 provider "aws" {
   region = "us-west-1"
   profile = "admin"
   
   default_tags {
     tags = local.tags
   }
 }

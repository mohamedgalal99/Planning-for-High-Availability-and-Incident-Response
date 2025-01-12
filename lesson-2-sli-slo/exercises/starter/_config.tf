terraform {
   backend "s3" {
     bucket = "udacity-tf-galal"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

 provider "aws" {
   region = "us-east-2"
   profile = "admin"
   
   default_tags {
     tags = local.tags
   }
 }

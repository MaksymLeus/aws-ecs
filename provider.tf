#####################################################################
# AWS providers
#####################################################################

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# add s3 bucket if needed
# terraform {
#   backend "s3" {
#     bucket = "itestmybucket"
#     key    = "./creads/credential" 
#     region = "us-east-1"
#   }
# }

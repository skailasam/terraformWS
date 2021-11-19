provider "aws" {
  profile = "terraformWS"
  region  = "eu-central-1"
  default_tags {
    tags = var.my_default_tags
  }
}

terraform {
  backend "s3" {
    profile = "terraformWS"
    bucket = "qwiklabs-tfstate-81389970-490f-11ec-a023-0a43a861ab2b"
    dynamodb_table = "qwiklabs-tfstate-lock"
    key = "terraform.tfstate"
    region = "eu-west-1"
  }
}

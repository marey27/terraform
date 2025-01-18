terraform {
  backend "s3" {
    bucket = "test-marey"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfstate"
  }
}

terraform {
  backend "s3" {
    bucket = "kpmg-demo-bucket"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
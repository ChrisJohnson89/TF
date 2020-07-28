provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARN2N7FC4Q74YSLGY"
  secret_key = "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"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "cj-tf-202007"
  acl    = "private"
}

resource "aws_default_vpc" "default" {}


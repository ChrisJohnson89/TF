provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAVDK4TRDA45NEXALF"
  secret_key = "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"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "cj-tf-202007"
  acl    = "private"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standard http and https ports inbound and everything outbound"

   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"] 
   }
   ingress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"] 
   }
   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"    
     cidr_blocks = ["0.0.0.0/0"] 
   }

   tags = { 
     "Terraform" : "true"
   }
}

provider "aws" {
region = "eu-central-1"
access_key = "AKIASM6IOEXCV2LC2LYU"
secret_key = "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"
}

resource "aws_instance" "Demo" {
ami = "ami-04e601abe3e1a910f"
instance_type = "t2.micro"
tags = {
Name = "FromTF"
}
}

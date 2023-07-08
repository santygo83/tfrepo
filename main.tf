provider "aws" {
region = "eu-central-1"
access_key = "AKIASM6IOEXCWHMWSWXC"
secret_key = "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"
}

resource "aws_instance" "Demo" {
ami = "ami-04e601abe3e1a910f"
instance_type = "t2.micro"
tags = {
Name = "FromTF"
}
}

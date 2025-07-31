provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 5
ami = "ami-020cba7c55df1f615"
instance_type = "t2.medium"
key_name = "project"
vpc_security_group_ids = ["sg-0b252a39f1b4c4475"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}

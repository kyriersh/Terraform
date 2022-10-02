variable "access_key" {}
variable "secret_key" {}
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}


resource "aws_instance" "my_ubuntu" {
      ami = "ami-08c40ec9ead489470"
      instance_type = "t3.small"
    }
    
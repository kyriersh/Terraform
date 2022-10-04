variable "access_key" {}
variable "secret_key" {}
variable "vpc_security_group_ids"  {
  type = map(list(string))
  default = {
    "default" = ["sg-0bb878c4011e7c539"]
  }
}


provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-1"
}



resource "aws_instance" "my_ubuntu" {
      count                  = 1
      ami                    = "ami-08c40ec9ead489470"
      instance_type          = "t3.small"
      vpc_security_group_ids = var.vpc_security_group_ids["default"]
      user_data = <<EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "The page was created by the user data." | sudo tee /var/www/html/index.html
EOF

      tags = {
        Name                 = "aws"
        Owner                = "Kyrylo Iershov"
        Project              = "Terraform practice"
      }


      lifecycle {
        create_before_destroy = true
      }
    }
    
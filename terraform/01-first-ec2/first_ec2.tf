terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

variable "myip" {
	default = "175.100.133.246/32"
}

resource "aws_instance" "first_ec2_with_terraform" {
	ami = "ami-0e6837d3d816a2ac6"
	instance_type = "t2.micro"
	key_name = "demo-key-pair"
	security_groups = ["allow_ansilbe"]
	tags = {
		Name = "ansible-bootcamp"
	}
}

resource "aws_security_group" "allow_ansible" {
  name        = "allow_ansilbe"
  description = "Allow access for ansible ec2"
  ingress {
    description = "allow ssh from Hardik home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow_SSH"
  }
}

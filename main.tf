provider "aws" {
  region = "eu-central-1"
}

##############################################################
# VPC
##############################################################

module "network" {
  source  = "git::ssh://git@github.com/diogoaurelio/terraform-aws-networking-vpc.git"
  version = "0.1.0"

  name     = "network"
  region   = "eu-central-1"
  vpc_cidr = "10.0.0.0/16"
  azs      = "eu-central-1a,eu-central-1b,eu-central-1c"

  environment = "${var.environment}"
  project     = "${var.project}"

  public_subnets    = "10.0.1.0/24,10.0.11.0/24,10.0.21.0/24"
  ephemeral_subnets = "10.0.2.0/24,10.0.12.0/24,10.0.22.0/24"
  private_subnets   = "10.0.3.0/24,10.0.13.0/24,10.0.23.0/24"
}


resource "aws_security_group" "allow_ssh_anywhere" {
  name        = "${var.environment}-${var.project}-ec2-ssh-anywhere"
  description = "Allow ssh traffic from anywhere"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}
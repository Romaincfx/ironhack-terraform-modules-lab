# modules/payroll/main.tf
resource "aws_instance" "payroll_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # You cannot do "vpc_id = var.vpc_id" here. Instead pick a subnet:
  subnet_id = data.aws_subnets.selected.ids[0]

  # If you need security groups, pass them here:
  # vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "Payroll-Server"
  }
}

resource "aws_s3_bucket" "payroll_docs" {
  bucket = var.s3_bucket_name
}

resource "aws_dynamodb_table" "payroll_db" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "EmployeeID"

  attribute {
    name = "EmployeeID"
    type = "S"
  }
}

# Use 'aws_subnets' instead of the old or invalid 'aws_subnet_ids'
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.main_vpc.id]
  }
}

resource "aws_default_vpc" "main_vpc" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

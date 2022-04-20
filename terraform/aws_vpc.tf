# Creating VPC
resource "aws_vpc" "interview_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Interview VPC"
  }
}
# Creating Private subnet 1 | Application Tier
resource "aws_subnet" "application-subnet-1" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = var.priSubnet1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Application Private Subnet 1"
  }
}

# Creating Private subnet 2 | Application Tier
resource "aws_subnet" "application-subnet-2" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = var.priSubnet2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Application Private Subnet 2"
  }
}

# Create Private subnet 3 | Database Tier
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = var.priSubnet3_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Database Private Subnet 1"
  }
}

# Create Private subnet 4 | Database Tier
resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = var.priSubnet4_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Database Private Subnet 1"
  }
}
# Creating 1st Public subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.interview_vpc.id
  cidr_block              = var.pubSubnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "Public Subnet 1"
  }
}

# Creating  2nd Public subnet 
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.interview_vpc.id
  cidr_block              = var.pubSubnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = aws_vpc.interview_vpc.id
}
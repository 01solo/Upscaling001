provider "aws" {
  region = "eu-west-2"
}
#Create a vpc
resource "aws_vpc" "dev01_vpc" {
  cidr_block = "10.0.0.0/16"
}
# Internet Gateway
resource "aws_internet_gateway" "dev01_gw" {
  vpc_id = aws_vpc.dev01_vpc.id

  tags = {
    Name = "Dev01_IGW"
  }
}

# Route Table for IGW
resource "aws_route_table" "dev01_rt" {
  vpc_id = aws_vpc.dev01_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev01_gw.id
  }

  tags = {
    Name = "Dev01_rt"
  }
}
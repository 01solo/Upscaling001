provider "aws" {
  region = "eu-west-2"
}
#Create a vpc
resource "aws_vpc" "sol_vpc" {
  cidr_block = "10.0.0.0/16"
}
# Internet Gateway
resource "aws_internet_gateway" "pet_gw" {
  vpc_id = aws_vpc.sol_vpc.id

  tags = {
    Name = "Pet_IGW"
  }
}

# Route Table for IGW
resource "aws_route_table" "pet_rt" {
  vpc_id = aws_vpc.sol_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pet_gw.id
  }

  tags = {
    Name = "pet_rt"
  }
}
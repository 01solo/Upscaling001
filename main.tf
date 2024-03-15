provider "aws" {
  region = "eu-west-2"
}
#Create a vpc
resource "aws_vpc" "sol_vpc" {
  cidr_block = "10.0.0.0/16"
}
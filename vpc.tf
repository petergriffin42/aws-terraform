resource "aws_vpc" "main" {
 cidr_block = var.VPC_subnet
 
 tags = {
   Name = "VPC"
 }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "VPC Gateway"
 }
}
locals {
  subnet_list = [   
    { subnet = "10.0.0.0/24", type = "public" },
    { subnet = "10.0.1.0/24", type = "public", az = "us-west-2b", name = "Custom Name Example Public" },
    { subnet = "10.0.128.0/24", type = "private" },
    { subnet = "10.0.129.0/24", type = "private", az = "us-west-2b", name = "Custom Name Example Private" }
  ]

}

resource "aws_subnet" "public_subnets" {
  for_each = { for index, subnet in local.subnet_list : index => subnet if subnet.type == "public" }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.subnet
  availability_zone = lookup(each.value, "az", var.default_aws_az)

  tags = {
    Name = lookup(each.value, "name", "public_subnet_${each.key}")
    Type = each.value.type
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = { for index, subnet in local.subnet_list : index => subnet if subnet.type == "private" }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.subnet
  availability_zone = lookup(each.value, "az", var.default_aws_az)

  tags = {
    Name = lookup(each.value, "name", "private_subnet_${each.key}")
    Type = each.value.type
  }
}

resource "aws_route_table" "public_rt" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "Public Route Table"
 }
}

resource "aws_route_table_association" "public_subnet_route_table" {
 for_each = { for index, subnet in aws_subnet.public_subnets : index => subnet }
 subnet_id      = each.value.id
 route_table_id = aws_route_table.public_rt.id
}
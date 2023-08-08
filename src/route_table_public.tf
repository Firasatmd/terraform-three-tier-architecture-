
#creating route table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}


#subnet associations

resource "aws_route_table_association" "route1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "route2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public_route_table.id
}

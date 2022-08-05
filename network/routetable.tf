//public subs-route
resource "aws_route_table" "publicroute" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgetaway.id
  }

  tags = {
    Name = "publicroute"
  }

}

//1st pub-sub association
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.publicroute.id
}

//2nd pub-sub association
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.publicsubnet2.id
  route_table_id = aws_route_table.publicroute.id
}


// private subs-route
resource "aws_route_table" "privateroute" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.mynat.id
  }

  tags = {
    Name = "privateroute"
  }

}

//1st priv-sub association
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.privatesubnet1.id
  route_table_id = aws_route_table.privateroute.id
}

//2nd priv-sub association
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.privateroute.id
}
resource "aws_eip" "lb" {

}

resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.publicsubnet1.id

  tags = {
    Name = "NAT GW"
  }

}


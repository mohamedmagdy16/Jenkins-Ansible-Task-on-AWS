resource "aws_subnet" "publicsubnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.publicsubnet1
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "publicsubnet1"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.publicsubnet2
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}b"

  tags = {
    Name = "publicsubnet2"
  }
}

resource "aws_subnet" "privatesubnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.privatesubnet1
  availability_zone = "${var.region}a"

  tags = {
    Name = "privatesubnet1"
  }
}

resource "aws_subnet" "privatesubnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.privatesubnet2
  availability_zone = "${var.region}b"

  tags = {
    Name = "privatesubnet2"
  }
}
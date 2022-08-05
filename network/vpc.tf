resource "aws_vpc" "myvpc" {
  cidr_block         = var.vpc
  enable_dns_support = "true"

  tags = {
    Name = "myvpc"
  }
}
output "vpc_id" {
    value = aws_vpc.myvpc.id
    description = "value of vpc_id"
}

output "publicsubnet1" {
    value = aws_subnet.publicsubnet1.id
    description = "value of publicsubnet1"
}

output "publicsubnet2" {
    value = aws_subnet.publicsubnet2.id
    description = "value of publicsubnet2"
}

output "privatesubnet1" {
    value = aws_subnet.privatesubnet1.id
    description = "value of privatesubnet1"
}

output "privatesubnet2" {
    value = aws_subnet.privatesubnet2.id
    description = "value of privatesubnet2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


// Ec2 bastion
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = module.network.publicsubnet1
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

provisioner "local-exec" {
    command="touch ${self.id}"
  }


  tags = {
    Name = "bastion"
  }
}


resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "key"
  public_key = tls_private_key.mykey.public_key_openssh
}

//  Ec2 application
resource "aws_instance" "app" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = module.network.privatesubnet1
  vpc_security_group_ids = [aws_security_group.sg-1.id]
  key_name               = aws_key_pair.generated_key.key_name


  tags = {
    Name = "app"
  }
}
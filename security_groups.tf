resource "aws_security_group" "sg-1" {
  ingress {
    from_port        = 22   
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  tags = {
    Name = "sg-1"
  }
}

resource "aws_security_group" "sg-2" {
  ingress {
    from_port        = 3000   
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-2"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "mykey"
  public_key = var.public_key
}


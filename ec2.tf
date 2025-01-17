resource "aws_instance" "bastion" {
  ami             = "ami-04b4f1a9cf54c11d0"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.sg-1}"]
  subnet_id       = aws_subnet.public-1.id
  key_name        = "mykey"
  tags = {
    Nmae = "bastion"
  }

}


resource "aws_instance" "production" {
  ami             = "ami-04b4f1a9cf54c11d0"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.sg-2}"]
  subnet_id       = aws_subnet.private-1.id
  tags = {
    Nmae = "production"
  }
}





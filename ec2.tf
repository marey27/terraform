resource "aws_instance" "bastion" {
  ami             = "ami-04b4f1a9cf54c11d0"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg-1.id]
  subnet_id       = aws_subnet.public-1.id
  key_name        = "mykey"
  tags = {
    Nmae = "bastion"
  }
  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > /home/marey/terraform/mykey.pem"
    
  }

}


resource "aws_instance" "production" {
  ami             = "ami-04b4f1a9cf54c11d0"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg-2.id]
  subnet_id       = aws_subnet.private-1.id
  tags = {
    Nmae = "production"
  }
}





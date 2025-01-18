resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.sg-1.id]
  key_name = "mykey"
  tags = {
    Name = "bastion"
  }
  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > /home/marey/terraform/mykey.pem"
    
  }
}

resource "aws_instance" "production" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private-1.id
  vpc_security_group_ids = [aws_security_group.sg-2.id]
  tags = {
    Name = "production"
  }
  
}
resource "aws_instance" "EC2-2" {
    ami = "cbshbchjsbhc"
    instance_type = t2.micro
    key_name = "my-key2"
    subnet_id = var.subnet1_cidr
    security_groups = ["${aws_security_group.security2.name}"]
    tags = {
      Name= "EC2-2" 
    }
  
}
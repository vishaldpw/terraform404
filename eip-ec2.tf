/*
resource "aws_eip" "IP2" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

resource "aws_instance" "web" {
  ami           = "ami-0f5daaa3a7fb3378b"
  instance_type = var.instance
  key_name      = "black-Bottle"
  tags = {
    Name = "Ubuntu1"

  }
}
##
output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}

*/
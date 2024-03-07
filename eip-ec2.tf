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

output "Server-IP" {
  #value = aws_instance.web1.public_ip
  value = aws_eip.IP2.public_ip
}
*/

resource "aws_eip" "IP2" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

resource "aws_instance" "web" {
  ami           = "ami-0f5daaa3a7fb3378b"
  instance_type = var.instance
  key_name      = "black-Bottle"
  tags = {
    Name = var.name   
  }
  connection {
    host = aws_instance.web.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file(".\\black-Bottle.pem")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt update",
      "sudo apt install -y ansible",
      "sudo hostnamectl set-hostname ansible",
      "sudo reboot"
    ]
  }
   provisioner "file" {
    source      = "ansible.tar"
    destination = "/home/ubuntu/ansible.tar"
}
}
##
output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_eip.IP2.public_ip
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

## END

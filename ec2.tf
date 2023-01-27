resource "aws_instance" "webserver" {

  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  key_name = "pubEC2Key"
  subnet_id = aws_subnet.labsubnet.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
associate_public_ip_address = true
#   root_block_device {
#     volume_type = "gp2"
#     volume_size = "30"
#     delete_on_termination = false

# }

 

  user_data = <<EOF

#!/bin/bash

sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install apache2 -y

sudo systemctl restart apache2

sudo chmod 777 -R /var/www/html/

cd /var/www/html/

sudo echo "<h1>This is our test website deployed using Terraform.</h1>" > index.html

EOF

  tags = {
    Name = "EC2Instance"
  }
}
/*
1. EC2 instance
2. New Security Group
    - Port 22
    - HTTPS 443
    - Node JS 3000 // ip:3000
*/

# Creating new EC2-VM

resource "aws_instance" "tf_ec2_instance" {
  ami           = "ami-01a00762f46d584a1" # Ubuntu Image
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "tf_key_ec2"
  vpc_security_group_ids = [aws_security_group.tf_ec2_sg.id]
  depends_on = [ aws_s3_object.tf_s3_object ]
    user_data = <<-EOF
    #!/bin/bash

    git clone https://github.com/verma-kunal/nodejs-mysql.git /home/ubuntu/nodejs-mysql
    cd /home/ubuntu/nodejs-mysql

    sudo apt update -y
    sudo apt install -y nodejs npm

    echo "DB_HOST=${local.rds_endpoint}" | sudo tee .env
    echo "DB_USER=${aws_db_instance.tf_rds_instance.username}" | sudo tee -a .env
    echo "DB_PASS=${aws_db_instance.tf_rds_instance.password}" | sudo tee -a .env
    echo "DB_NAME=${aws_db_instance.tf_rds_instance.db_name}" | sudo tee -a .env
    echo "TABLE_NAME=users" | sudo tee -a .env
    echo "PORT=3000" | sudo tee -a .env

    npm install
    npm start
  EOF
  user_data_replace_on_change = true

  tags = {
    Name = "NodeJS-VM"
  }
}


# Creating Security Group and attaching it to EC2 instance

resource "aws_security_group" "tf_ec2_sg" {
  name        = "ec2_test_SG"
  description = "Allow SSH and HTTPS"
  vpc_id      = "vpc-0876ef68c89fbca9d"

  tags = {
    Name = "allow_ssh_https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tf_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.tf_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_nodejs" {
  security_group_id = aws_security_group.tf_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.tf_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}



output "out_ec2_instance_info" {
  value = "ssh -i \"$env:USERPROFILE\\.ssh\\tf_key_ec2.pem\" ubuntu@${aws_instance.tf_ec2_instance.public_ip}"
}
/*
1. RDS tf resource
2. Security Group
    - Open 3306
        - security group => tf_ec2_sg
        - cidr_block => "local IP"

3. Outputs - To give the relevant details post deployment.
*/

# RDS config

resource "aws_db_instance" "tf_rds_instance" {
  identifier = "nodejs-rds-mysql"
  allocated_storage    = 10
  db_name              = "ratnavo_db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "********"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible = true
  vpc_security_group_ids = [aws_security_group.tf_rds_sg.id]
}


# Creating Security Group and attaching it to RDS instance

resource "aws_security_group" "tf_rds_sg" {
  name        = "rds_test_SG"
  description = "Allow MySQL"
  vpc_id      = "vpc-0876ef68c89fbca9d"
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_to_Rds" {
  security_group_id = aws_security_group.tf_rds_sg.id
  cidr_ipv4         = "49.205.255.201/32"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql_from_ec2" {
  security_group_id            = aws_security_group.tf_rds_sg.id
  referenced_security_group_id = aws_security_group.tf_ec2_sg.id
  from_port                    = 3306
  ip_protocol                  = "tcp"
  to_port                      = 3306
}


resource "aws_vpc_security_group_egress_rule" "allow_outside" {
  security_group_id = aws_security_group.tf_rds_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


locals {
  rds_endpoint = element(split(":", aws_db_instance.tf_rds_instance.endpoint), 0)
}



output "out_rds_endpoint" {
  value = local.rds_endpoint
}

output "rds_user_name" {
  value = aws_db_instance.tf_rds_instance.username
}

output "out_db_name" {
  value = aws_db_instance.tf_rds_instance.db_name
}
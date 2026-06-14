# Node.js MySQL App Deployment with Terraform

This folder contains a small Node.js application connected to a MySQL database, along with Terraform configuration used to deploy it on AWS.

The original Node.js application source code is from:
[verma-kunal/nodejs-mysql](https://github.com/verma-kunal/nodejs-mysql)

I am using this project as a practical deployment exercise to understand how an application, database, networking, and infrastructure automation fit together in a real AWS setup.

## What This Project Includes

The application is a simple Express.js app that connects to a MySQL database using environment variables from a `.env` file.

The Terraform setup provisions AWS resources such as:

- EC2 instance for running the Node.js application
- RDS MySQL database for application data
- Security groups for SSH, HTTPS, Node.js, and MySQL access
- S3 resources for storing project-related files or assets
- EC2 user data to bootstrap the server and start the application

## Folder Overview

```text
nodejs-mysql/
├── server.js
├── package.json
├── public/
├── db_commands.txt
├── README.md
└── AWS-Node-JS-Deployment/
    ├── ec2.tf
    ├── rds.tf
    ├── storage_s3.tf
    ├── provider.tf
    └── main.tf
```

## Application Configuration

The Node.js app expects a `.env` file with values similar to:

```bash
DB_HOST="your-rds-endpoint"
DB_USER="admin"
DB_PASS="your-db-password"
DB_NAME="your-db-name"
TABLE_NAME="users"
PORT=3000
```

For local testing, these values can point to a local MySQL database. For AWS deployment, `DB_HOST` should point to the RDS endpoint.

## Terraform Deployment Flow

The Terraform files inside `AWS-Node-JS-Deployment` are used to create the AWS infrastructure.

Typical commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

After the EC2 instance is created, the application can be accessed using the public IP and port `3000`, assuming the security group allows inbound traffic on that port.

Example:

```text
http://<ec2-public-ip>:3000
```

## Why I Built This

The goal of this project is hands-on practice with Terraform and AWS by deploying a real application instead of only creating isolated cloud resources.

While working through this setup, I practiced:

- Creating EC2 and RDS resources with Terraform
- Connecting a Node.js app to an RDS MySQL database
- Managing AWS security group rules
- Using EC2 key pairs and SSH from Windows
- Passing application configuration through environment variables
- Debugging real deployment issues step by step

This is a learning project, so the setup is intentionally simple and focused on understanding the deployment flow end to end.

## Notes

Do not commit real secrets, database passwords, or private key files to Git.

For production use, secrets should be managed through a safer approach such as AWS Secrets Manager, SSM Parameter Store, or Terraform variables marked as sensitive.

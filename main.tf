# Configuración principal del proyecto
# Despliegue de múltiples instancias EC2 con Terraform

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# Data sources para obtener información de la VPC existente
data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

# Security Group para las instancias EC2
resource "aws_security_group" "ec2_sg" {
  name_prefix = "${var.project_name}-ec2-sg-"
  vpc_id      = var.vpc_id

  # Regla para SSH
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  # Regla para HTTP
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  # Regla para HTTPS
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  # Regla para tráfico saliente
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-security-group"
  }
}

# User data script para configuración inicial
locals {
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from EC2 Instance $(hostname -f)</h1>" > /var/www/html/index.html
              EOF
}

# Módulo EC2 Instance
module "ec2_instances" {
  source = "./modules/ec2_instance"

  # Parámetros requeridos
  ami_id    = var.ami_id
  subnet_id = var.subnet_id

  # Parámetros opcionales con valores personalizados
  instance_type        = var.instance_type
  instance_count       = var.instance_count
  instance_name_prefix = var.instance_name_prefix
  environment          = var.environment
  project              = var.project_name

  # Security groups
  security_group_ids = [aws_security_group.ec2_sg.id]

  # User data para configuración inicial
  user_data = base64encode(local.user_data)

  # Configuración de almacenamiento
  root_volume_size = 10
  root_volume_type = "gp3"
} 
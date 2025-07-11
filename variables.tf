# Variables principales del proyecto

variable "aws_region" {
  description = "Región de AWS donde desplegar los recursos"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "terraform-ec2-project"
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
  default     = "dev"
}


variable "vpc_id" {
  description = "ID de la VPC donde crear los recursos"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde crear las instancias EC2"
  type        = string
}

variable "ami_id" {
  description = "ID del AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (us-east-1)
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Número de instancias EC2 a crear"
  type        = number
  default     = 3
}

variable "instance_name_prefix" {
  description = "Prefijo para el nombre de las instancias"
  type        = string
  default     = "web-server"
}

variable "allowed_cidr_blocks" {
  description = "Bloques CIDR permitidos para SSH y HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-ec2-project"
    ManagedBy   = "terraform"
  }
} 
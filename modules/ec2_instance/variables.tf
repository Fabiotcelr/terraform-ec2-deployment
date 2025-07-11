# Variables del módulo EC2 Instance

variable "ami_id" {
  description = "ID del AMI para las instancias EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Número de instancias EC2 a crear"
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "ID de la subnet donde crear las instancias"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups"
  type        = list(string)
  default     = []
}

variable "instance_name_prefix" {
  description = "Prefijo para el nombre de las instancias"
  type        = string
  default     = "ec2-instance"
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "terraform-ec2-project"
}

variable "user_data" {
  description = "Script de user data para configuración inicial"
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Tamaño del volumen raíz en GB"
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "Tipo de volumen raíz"
  type        = string
  default     = "gp2"
} 
# Ejemplo de configuración para diferentes escenarios
# Este archivo muestra cómo configurar el proyecto para diferentes casos de uso

# ========================================
# ESCENARIO 1: Desarrollo (Default)
# ========================================
aws_region = "us-east-1"
project_name = "terraform-ec2-project"
environment  = "dev"


# Configuración de red (AJUSTAR SEGÚN TU VPC)
vpc_id    = "vpc-12345678"
subnet_id = "subnet-87654321"

# Configuración de instancias
ami_id         = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
instance_type  = "t3.micro"
instance_count = 2

instance_name_prefix = "dev-server"

# Seguridad (solo para desarrollo)
allowed_cidr_blocks = ["0.0.0.0/0"]

# ========================================
# ESCENARIO 2: Producción (Comentar el anterior y descomentar este)
# ========================================
# aws_region = "us-west-2"
# project_name = "terraform-ec2-project"
# environment  = "prod"
# 
# vpc_id    = "vpc-prod-12345678"
# subnet_id = "subnet-prod-87654321"
# 
# ami_id         = "ami-0892d3c7ee96c0bf7"  # Amazon Linux 2 (us-west-2)
# instance_type  = "t3.small"
# instance_count = 5
# 
# instance_name_prefix = "prod-server"
# 
# # Seguridad más restrictiva para producción
# allowed_cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

# ========================================
# ESCENARIO 3: Testing (Comentar los anteriores y descomentar este)
# ========================================
# aws_region = "us-east-1"
# project_name = "terraform-ec2-project"
# environment  = "test"
# 
# vpc_id    = "vpc-test-12345678"
# subnet_id = "subnet-test-87654321"
# 
# ami_id         = "ami-0c55b159cbfafe1f0"
# instance_type  = "t3.nano"
# instance_count = 1
# 
# instance_name_prefix = "test-server"
# 
# allowed_cidr_blocks = ["192.168.1.0/24"]

# Tags comunes para todos los escenarios
tags = {
  Environment = "dev"
  Project     = "terraform-ec2-project"
  ManagedBy   = "terraform"
  Owner       = "estudiante"
  Purpose     = "learning"
} 
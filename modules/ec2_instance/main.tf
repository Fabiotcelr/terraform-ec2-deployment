# Módulo EC2 Instance
# Este módulo crea múltiples instancias EC2 usando count

resource "aws_instance" "ec2_instances" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "${var.instance_name_prefix}-${count.index + 1}"
    Environment = var.environment
    Project = var.project
  }

  # User data para configuración inicial (opcional)
  user_data = var.user_data != null ? var.user_data : null

  # Configuración de almacenamiento
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }
} 
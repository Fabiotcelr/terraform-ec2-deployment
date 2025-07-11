# Outputs del módulo EC2 Instance

output "instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = aws_instance.ec2_instances[*].id
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias EC2"
  value       = aws_instance.ec2_instances[*].public_ip
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias EC2"
  value       = aws_instance.ec2_instances[*].private_ip
}

output "instance_names" {
  description = "Nombres de las instancias EC2"
  value       = aws_instance.ec2_instances[*].tags["Name"]
}

output "instance_count" {
  description = "Número total de instancias creadas"
  value       = length(aws_instance.ec2_instances)
}

output "availability_zones" {
  description = "Zonas de disponibilidad donde se crearon las instancias"
  value       = aws_instance.ec2_instances[*].availability_zone
} 
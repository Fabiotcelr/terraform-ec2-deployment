# Outputs del proyecto principal

output "project_info" {
  description = "Información general del proyecto"
  value = {
    project_name = var.project_name
    environment  = var.environment
    region       = var.aws_region
    vpc_id       = var.vpc_id
    subnet_id    = var.subnet_id
  }
}

output "security_group_info" {
  description = "Información del Security Group creado"
  value = {
    id   = aws_security_group.ec2_sg.id
    name = aws_security_group.ec2_sg.name
  }
}


# Outputs del módulo EC2
output "ec2_instances_info" {
  description = "Información completa de las instancias EC2"
  value = {
    instance_ids        = module.ec2_instances.instance_ids
    public_ips          = module.ec2_instances.public_ips
    private_ips         = module.ec2_instances.private_ips
    instance_names      = module.ec2_instances.instance_names
    instance_count      = module.ec2_instances.instance_count
    availability_zones  = module.ec2_instances.availability_zones
  }
}

output "instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = module.ec2_instances.instance_ids
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias EC2"
  value       = module.ec2_instances.public_ips
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias EC2"
  value       = module.ec2_instances.private_ips
}

output "instance_names" {
  description = "Nombres de las instancias EC2"
  value       = module.ec2_instances.instance_names
}

output "total_instances" {
  description = "Número total de instancias creadas"
  value       = module.ec2_instances.instance_count
}

# Output útil para conectarse por SSH
output "ssh_connection_info" {
  description = "Información para conectarse por SSH a las instancias"
  value = [
    for i, ip in module.ec2_instances.public_ips : {
      instance_name = module.ec2_instances.instance_names[i]
      public_ip     = ip
      ssh_command   = "ssh -i your-key.pem ec2-user@${ip}"
    }
  ]
}

# Output para acceder a las páginas web
output "web_access_info" {
  description = "URLs para acceder a las páginas web de las instancias"
  value = [
    for ip in module.ec2_instances.public_ips : "http://${ip}"
  ]
} 
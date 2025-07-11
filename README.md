# 🚀 Proyecto Terraform: Despliegue de Múltiples Instancias EC2

Este proyecto implementa una infraestructura en AWS utilizando Terraform para desplegar múltiples instancias EC2 de forma automatizada y modular.

## 📋 Características

- ✅ **Módulos reutilizables**: Módulo `ec2_instance` para crear instancias EC2
- ✅ **Variables parametrizadas**: Configuración flexible mediante variables
- ✅ **Count para múltiples recursos**: Creación dinámica de instancias
- ✅ **Outputs informativos**: Información útil después del despliegue
- ✅ **Security Groups**: Configuración de seguridad automática
- ✅ **User Data**: Configuración inicial automática de las instancias

## 🏗️ Estructura del Proyecto

```
terraform-ec2-project/
├── modules/
│   └── ec2_instance/
│       ├── main.tf          # Recursos EC2 con count
│       ├── variables.tf     # Variables del módulo
│       └── outputs.tf       # Outputs del módulo
├── main.tf                  # Configuración principal
├── variables.tf             # Variables del proyecto
├── outputs.tf               # Outputs del proyecto
├── terraform.tfvars.example # Ejemplo de configuración
└── README.md               # Este archivo
```

## 🎯 Objetivos de Aprendizaje

Al completar este proyecto, serás capaz de:

- ✅ Declarar y utilizar variables en Terraform
- ✅ Crear y consumir módulos reutilizables
- ✅ Usar `count` para crear múltiples recursos
- ✅ Utilizar outputs para exponer información clave
- ✅ Configurar Security Groups y networking
- ✅ Implementar User Data para configuración inicial

## 🚀 Inicio Rápido

### Prerrequisitos

1. **Terraform** instalado (versión >= 1.0)
2. **AWS CLI** configurado con credenciales
3. **VPC y Subnet** existentes en AWS

### Pasos de Despliegue

1. **Clonar o descargar el proyecto**
   ```bash
   git clone <repository-url>
   cd terraform-ec2-project
   ```

2. **Configurar variables**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Editar terraform.tfvars con tus valores
   ```

3. **Inicializar Terraform**
   ```bash
   terraform init
   ```

4. **Revisar el plan**
   ```bash
   terraform plan
   ```

5. **Aplicar la configuración**
   ```bash
   terraform apply
   ```

6. **Verificar los outputs**
   ```bash
   terraform output
   ```

## ⚙️ Configuración

### Variables Requeridas

- `vpc_id`: ID de la VPC donde crear los recursos
- `subnet_id`: ID de la subnet donde crear las instancias

### Variables Opcionales

- `aws_region`: Región de AWS (default: us-east-1)
- `instance_count`: Número de instancias (default: 3)
- `instance_type`: Tipo de instancia (default: t3.micro)
- `ami_id`: ID del AMI (default: Amazon Linux 2)

### Ejemplo de terraform.tfvars

```hcl
aws_region = "us-east-1"
vpc_id     = "vpc-12345678"
subnet_id  = "subnet-87654321"
instance_count = 3
instance_type  = "t3.micro"
```

## 📊 Outputs Disponibles

Después del despliegue, Terraform mostrará:

- **instance_ids**: IDs de todas las instancias creadas
- **public_ips**: Direcciones IP públicas
- **private_ips**: Direcciones IP privadas
- **instance_names**: Nombres de las instancias
- **ssh_connection_info**: Comandos SSH para conectarse
- **web_access_info**: URLs para acceder a las páginas web

## 🔧 Módulo EC2 Instance

El módulo `ec2_instance` incluye:

### Parámetros de Entrada
- `ami_id`: ID del AMI
- `instance_type`: Tipo de instancia
- `instance_count`: Número de instancias
- `subnet_id`: ID de la subnet
- `security_group_ids`: Lista de Security Groups

### Salidas
- `instance_ids`: IDs de las instancias
- `public_ips`: IPs públicas
- `private_ips`: IPs privadas
- `instance_names`: Nombres de las instancias

## 🛡️ Seguridad

El proyecto crea automáticamente un Security Group con:
- Puerto 22 (SSH) abierto
- Puerto 80 (HTTP) abierto
- Puerto 443 (HTTPS) abierto
- Todo el tráfico saliente permitido

**⚠️ Importante**: Para producción, restringe `allowed_cidr_blocks` a IPs específicas.

## 🧹 Limpieza

Para destruir todos los recursos:

```bash
terraform destroy
```

## 📝 Notas Importantes

1. **Costos**: Las instancias EC2 generan costos en AWS
2. **Región**: Asegúrate de usar la región correcta
3. **AMI**: Verifica que el AMI sea válido para tu región
4. **VPC/Subnet**: Deben existir antes del despliegue

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

---

**¡Éxitos en tu aprendizaje de Terraform! 🚀** 
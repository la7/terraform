# task_10000_vpc

Descripción
- Módulo Terraform para crear la VPC y recursos de red asociados en AWS.

Requisitos
- Terraform >= 0.12
- Credenciales AWS configuradas (perfil, variables de entorno o IAM)

Archivos clave
- `main.tf`, `variables.tf`, `terraform.tfvars`, `terraform.tfstate`

Uso rápido
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notas
- Este proyecto usa fichero de estado local (`terraform.tfstate`). Para equipos, configurar backend remoto (S3 + DynamoDB).

# task_10004_elb

Descripción
- Módulo Terraform para crear un ELB (Load Balancer) y recursos asociados en AWS.

Requisitos
- Terraform >= 0.12
- Credenciales AWS configuradas (perfil, variables de entorno o IAM)

Archivos clave
- `main.tf`, `output.tf`, `terraform.tfvars`, `terraform.tfstate`

Uso rápido
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notas
- Considerar usar backend remoto para el estado en entornos de equipo.

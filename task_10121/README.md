# task_10121

Descripción
- Proyecto Terraform con recursos AWS (ver `main.tf` y `output.tf`).

Requisitos
- Terraform >= 0.12
- Credenciales AWS configuradas

Archivos clave
- `main.tf`, `output.tf`, `terraform.tfvars`, `terraform.tfstate`

Uso rápido
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notas
- Revisar `variables.tf` y `terraform.tfvars` antes de aplicar.

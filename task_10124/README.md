# task_10124

Descripción
- Proyecto Terraform con recursos definidos en `main.tf` y salidas en `output.tf`.

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
- Usar backend remoto para colaborar con otros usuarios.

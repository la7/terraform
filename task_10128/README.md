# task_10128

Descripción
- Proyecto Terraform con definiciones en `data.tf`, `main.tf` y `output.tf`.

Requisitos
- Terraform >= 0.12
- Credenciales AWS configuradas

Archivos clave
- `data.tf`, `main.tf`, `output.tf`, `terraform.tfvars`, `terraform.tfstate`

Uso rápido
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notas
- Verificar dependencias entre módulos si se comparte estado.

# task_10122

Descripción
- Proyecto Terraform específico (revisar `main.tf`). Incluye claves `my-terraform-key` en este directorio.

Requisitos
- Terraform >= 0.12
- Credenciales AWS configuradas

Archivos clave
- `main.tf`, `variables.tf`, `terraform.tfvars`, `terraform.tfstate`, `my-terraform-key`

Uso rápido
```bash
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notas
- Mantener las claves privadas fuera de repositorios públicos. Añadir a `.gitignore` si corresponde.

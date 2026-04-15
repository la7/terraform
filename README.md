# Infraestructura Terraform

Repositorio con varios proyectos Terraform independientes (cada carpeta contiene su propio estado/local o configuraciones).

Proyectos incluidos
- [task_10000_vpc/README.md](task_10000_vpc/README.md) — VPC y recursos de red
- [task_10004_elb/README.md](task_10004_elb/README.md) — Load Balancer (ELB)
- [task_10121/README.md](task_10121/README.md) — Proyecto con recursos varios
- [task_10122/README.md](task_10122/README.md) — Proyecto (contiene claves privadas en el directorio)
- [task_10124/README.md](task_10124/README.md) — Proyecto con salidas (`output.tf`)
- [task_10128/README.md](task_10128/README.md) — Proyecto con `data.tf` y definiciones adicionales

Notas
- Cada carpeta se puede tratar como un repo independiente si se desea (ver instrucciones en los README individuales).
- Para colaboración, mover el estado local a un backend remoto (S3 + DynamoDB) es recomendado.

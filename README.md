# fast-food-fase-3-terraform-db

## Provisionamento da infraestrutura em cloud

### Comandos usados para teste local
- terraform init
- terraform plan
- terraform apply
- aws rds describe-db-instances
- RDS_STATE_BUCKET= aws rds describe-db-instances --db-instance-identifier my-rds-instance --query "DBInstances[0].Endpoint.Address" --output text
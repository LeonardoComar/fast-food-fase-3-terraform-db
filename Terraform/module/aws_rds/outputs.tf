output "rds_endpoint" {
  value = aws_db_instance.postgres_fastfood_instance_rds.endpoint
}
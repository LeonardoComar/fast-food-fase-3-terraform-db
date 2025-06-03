resource "aws_secretsmanager_secret" "aws_secretsmanager_secret_fastfood_3" {
  name = "aws-secretsmanager-secret-fastfood-3"
}

resource "aws_secretsmanager_secret_version" "aws_secretsmanager_secret_version_fastfood_3" {
  secret_id     = aws_secretsmanager_secret.aws_secretsmanager_secret_fastfood_3.id
  secret_string = "Host=${aws_db_instance.postgres_fastfood_instance_rds.endpoint};Database=${var.db_name};Username=${var.username};Password=${random_password.db_password.result}"

  depends_on = [aws_db_instance.postgres_fastfood_instance_rds, random_password.db_password]
}

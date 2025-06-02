resource "aws_secretsmanager_secret" "aws_secretsmanager_secret_fastfood" {
  name = "aws-secretsmanager-secret-fastfood"
}

resource "aws_secretsmanager_secret_version" "aws_secretsmanager_secret_version_fastfood" {
  secret_id     = aws_secretsmanager_secret.aws_secretsmanager_secret_fastfood.id
  secret_string = "Host=${aws_db_instance.mysql_fastfood_instance_rds.endpoint};Database=${var.db_name};Username=${var.username};Password=${random_password.db_password.result}"

  depends_on = [aws_db_instance.mysql_fastfood_instance_rds, random_password.db_password]
}

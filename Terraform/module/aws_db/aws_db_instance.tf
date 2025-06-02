resource "aws_db_instance" "mysql_fastfood_instance_rds" {
  identifier              = "mysql-fastfood-instance-rds"
  allocated_storage       = 10
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.41"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.username
  password                = random_password.db_password.result
  vpc_security_group_ids  = [aws_security_group.fastfood_security_group_rds.id]
  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 7
  db_subnet_group_name    = aws_db_subnet_group.subnet_group_rds.name

  tags = {
    Name = "mysql-fastfood-instance-rds"
  }

  depends_on = [
    aws_security_group.fastfood_security_group_rds,
    aws_db_subnet_group.subnet_group_rds
  ]
}
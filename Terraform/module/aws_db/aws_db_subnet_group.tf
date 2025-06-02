resource "aws_db_subnet_group" "subnet_group_rds" {
  name       = "subnet-group-rds"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "subnet-group-rds"
  }
}
resource "aws_db_subnet_group" "subnet_group_rds" {
  name       = "fastfood-subnet-group-rds"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "fastfood-subnet-group-rds"
  }
}
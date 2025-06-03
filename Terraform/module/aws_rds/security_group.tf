resource "aws_security_group" "fastfood_security_group_rds" {
  name        = "fastfood-security-group-rds"
  description = "Security group para RDS PostgreSQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fastfood-security-group-rds"
  }
}
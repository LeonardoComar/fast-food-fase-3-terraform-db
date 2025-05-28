terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
  # access_key = ""
  # secret_key = ""
  # token      = ""
}

#########################
# Variáveis
#########################

variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "db_identifier" {
  description = "Identificador do banco RDS"
  type        = string
  default     = "my-rds-instance"
}

variable "db_engine" {
  description = "Motor de banco de dados (mysql, postgres, etc.)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Versão do motor de banco de dados"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "Classe da instância RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Nome do banco de dados padrão"
  type        = string
  default     = "db_fastfood" // Usando sublinhado em vez de hífen
}

variable "db_username" {
  description = "Usuário master do banco de dados"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha master do banco de dados"
  type        = string
  sensitive   = true
  default     = null # Remova qualquer valor padrão, se existir
}

variable "db_allocated_storage" {
  description = "Espaço de armazenamento (GB) alocado"
  type        = number
  default     = 20
}

variable "db_publicly_accessible" {
  description = "Se o RDS deve ser acessível publicamente"
  type        = bool
  default     = false
}

#########################
# Resource: RDS
#########################

resource "aws_db_instance" "default" {
  identifier              = var.db_identifier
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  allocated_storage       = var.db_allocated_storage
  max_allocated_storage   = var.db_allocated_storage
  storage_type            = "gp3"
  publicly_accessible     = var.db_publicly_accessible
  backup_retention_period = 7
  skip_final_snapshot     = true

  vpc_security_group_ids = [
    data.aws_security_group.default.id
  ]

  tags = {
    Name        = "${var.db_identifier}-rds"
    Environment = terraform.workspace
  }
}

#########################
# Data Source: Default SG
#########################

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

#########################
# Data Source: Default VPC
#########################

data "aws_vpc" "default" {
  default = true
}

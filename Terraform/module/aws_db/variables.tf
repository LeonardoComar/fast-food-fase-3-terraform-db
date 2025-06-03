variable "db_name" {
  type    = string
  default = "fastfood"
}

variable "username" {
  type    = string
  default = "root"
}

variable "vpc_id" {
  description = "ID da vpc"
  type        = string
}


variable "security_group_id" {
  description = "ID do security group da vpc"
  type        = any
}

variable "subnet_ids" {
  description = "IDs das subnets"
  type        = list(string)
}
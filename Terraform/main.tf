module "aws_rds" {
  source = "./module/aws_rds"

  vpc_id            = data.aws_vpc.fastfood_vpc.id
  subnet_ids        = local.subnet_privates_ids
  security_group_id = data.aws_security_group.fastfood_security_group.id
}
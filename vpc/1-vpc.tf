locals {
  name_prefix = "${var.app_name}-${var.env}"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name_prefix}_vpc"
  }
}

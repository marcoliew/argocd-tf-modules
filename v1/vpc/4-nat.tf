resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name = "${local.name_prefix}_nat"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${local.name_prefix}_nat"
  }

  depends_on = [aws_internet_gateway.this]
}

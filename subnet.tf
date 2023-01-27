resource "aws_subnet" "labsubnet" {
  vpc_id     = aws_vpc.myteravpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "labsubnet"
  }
}
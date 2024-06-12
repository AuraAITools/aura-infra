resource "aws_eip" "ec2_eip" {
  # instance   = aws_instance.ec2.id
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_instance" "ec2" {
  ami                    = "ami-0be48b687295f8bd6"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  key_name = "deployer-kp"
  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}

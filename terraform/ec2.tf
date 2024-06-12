resource "aws_instance" "ec2" {
  ami                    = "ami-0be48b687295f8bd6"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  key_name = "deployer-kp"
  user_data = <<-EOF
            #!/bin/bash
            # Update the package index
            sudo apt-get update -y

            # Install required packages
            sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

            # Add Docker’s official GPG key
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

            # Add Docker repository
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y

            # Update the package index again
            sudo apt-get update -y

            # Install Docker
            sudo apt-get install -y docker-ce

            # Start Docker service
            sudo systemctl start docker

            # Enable Docker service to start on boot
            sudo systemctl enable docker

            # Add the default user (ubuntu) to the docker group
            sudo usermod -aG docker ubuntu

            # Install Docker Compose
            sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
            EOF
  tags = {
    Name        = "aura"
    Environment = "dev"
  }
}

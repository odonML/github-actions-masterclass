# 1. Crear el Key Pair para acceso SSH 
resource "aws_key_pair" "deployer" {
  key_name   = "${var.project_name}-key"
  public_key = var.public_key
}

# 2. Security Group (El Firewall)
resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-sg"
  description = "Permitir HTTP y SSH"

  ingress {
    description = "SSH de cualquier lugar"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP de cualquier lugar"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. La instancia EC2
resource "aws_instance" "web_server" {
  ami           = "ami-0c101f26f147fa7fd" # Amazon Linux 2 (verifica según tu región)
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Instalación automática de Apache y permisos
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo chown -R ec2-user:ec2-user /var/www
              sudo chmod -R 755 /var/www
              EOF

  tags = {
    Name = var.project_name
  }
}
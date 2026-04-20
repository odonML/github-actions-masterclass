output "instance_ip" {
  value       = aws_instance.web_server.public_ip
  description = "IP publica de la instancia para el despliegue"
}
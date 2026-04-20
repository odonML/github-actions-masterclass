variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "project_name" {
  default = "astro-demo-web"
}

variable "public_key" {
  description = "Contenido de tu archivo .pub para acceder por SSH"
  type= string
}
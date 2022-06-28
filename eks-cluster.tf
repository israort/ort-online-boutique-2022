#Declaracion de AWS como provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

#Se crea el recurso VPC
resource "aws_vpc" "boutique-vpc" {
  cidr_block       = "172.17.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "boutique-vpc"
  }
}

#Creacion de subnet para DMZ (frontend)
resource "aws_subnet" "boutique-public-subnet" {
  vpc_id                  = aws_vpc.boutique-vpc.id
  cidr_block              = "172.17.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "boutique-public-subnet"
  }
}

#Creacion de subnet para resto de los servicios
resource "aws_subnet" "boutique-private-subnet" {
  vpc_id                  = aws_vpc.boutique-vpc.id
  cidr_block              = "172.17.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "boutique-private-subnet"
  }
}

#Security group con trafico http/https
resource "aws_security_group" "boutique-sg-http" {
  name        = "boutique-sg-http"
  description = "trafico-http"
  vpc_id      = aws_vpc.boutique-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

#Creacion de internet gateway para entrada y salida a internet
resource "aws_internet_gateway" "internetgateway-boutique" {
  vpc_id = aws_vpc.boutique-vpc.id
}

#Se define ruta por defecto de la vpc
resource "aws_default_route_table" "routetable-boutique" {
  default_route_table_id = aws_vpc.boutique-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway-boutique.id
  }
}

#Se crea cluster EKS
resource "aws_eks_cluster" "oblig-online-boutique" {
  name     = "oblig-online-boutique"
  role_arn = "arn:aws:iam::025891832913:role/LabRole"

  vpc_config {
    subnet_ids         = [aws_subnet.boutique-public-subnet.id, aws_subnet.boutique-private-subnet.id]
    security_group_ids = [aws_security_group.boutique-sg-http.id]
  }
}

#Se define Node Group y auto scaling
resource "aws_eks_node_group" "boutique-node-group" {
  cluster_name    = aws_eks_cluster.oblig-online-boutique.name
  node_group_name = "boutique-node-group"
  node_role_arn   = "arn:aws:iam::025891832913:role/LabRole"
  subnet_ids      = [aws_subnet.boutique-public-subnet.id, aws_subnet.boutique-private-subnet.id]
  instance_types  = ["t2.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
}
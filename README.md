# ort-online-boutique-2022

Creación y subida de imágenes a repositorio público

Para depositar las imágenes a utilizar, se eligió el servicio ECR (Elastic Container Registry), el cual entregó la siguiente url: 025891832913.dkr.ecr.us-east-1.amazonaws.com
Conexión al ECR:
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 025891832913.dkr.ecr.us-east-1.amazonaws.com
Para la creación de imágenes, se fue al repositorio descargado de git entregado por los profesores, a cada una de las carpetas de los microservicios:


Allí, en cada una de ellas, se encontraba un archivo Dockerfile:



Se ejecutaron los siguientes comandos para crear las imágenes, cada comando se corrio en la carpeta correspondiente al servicio:

docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-adservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-cartservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-checkoutservices-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-currencyservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-emailservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-frontend-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-loadgenerator-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-paymentservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-productcatalogservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-recommendationservice-isra:latest .
docker build -t 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-shippingservice-isra:latest .


Luego se subieron al repositorio:

docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-adservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-cartservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-checkoutservices-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-currencyservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-emailservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-frontend-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-loadgenerator-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-paymentservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-productcatalogservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-recommendationservice-isra
docker push 025891832913.dkr.ecr.us-east-1.amazonaws.com/boutique-online-shippingservice-isra

Repositorios en ECR:



IAC en Terraform

Se creó el archivo eks-cluster.tf, para crear toda la infraestructura necesaria para correr los microservicios en EKS.
Los recursos creados a traves de terraform son los siguientes:












Script de bash

Se utiliza un script de bash, para ejecutar terraform, y luego hacer los deployments de los microservicios:



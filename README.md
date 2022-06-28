# ort-online-boutique-2022

Instrucciones de uso:

Los siguientes archivos deben estar en el mismo repositorio:

- script_microservicios.sh
- eks-cluster.tf
- *.yaml

El script de bash contiene la invocación al archivo eks-cluster.tf, quien crea toda la infraestructura necesaria para montar un cluster EKS, esto es:

-VPC
-Subnets
-Security Groups
-Internet Gateway
-Defaul Route Table
-Cluster EKS
-EKS Node Group

Luego el script continua realizando los 12 deployments ejecutando cada uno de los archivos yaml.
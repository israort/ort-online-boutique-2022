# Obligatorio 2022 - Implementacion de Soluciones Cloud
## Micaela Plada - 211319
## Diego Zignago - 204523
## Israel Bellizzi - 144606

### Instrucciones de uso:

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


### Presentacion ejecutiva:

Se presenta una solucioón para modernizar y desplegar la arquitectura de "e-shop Services" a traves de un cluster EKS montado en Amazon Web Services. Se elije la siguiente arquitectura:

![Diagrama Arquitectura](Arquitectura.jpg)

#Este script debe estar en el mismo directorio que el codigo terraform, y que los archivos yaml de deployment

#Comandos terraform, toma y ejecuta el codigo escrito en el archivo: eks-cluster.tf
terraform init
terraform apply -auto-approve

#Conexion a cluster recien creado
aws eks --region us-east-1 update-kubeconfig --name oblig-online-boutique

#Se deployan el redis y el resto de los microservicios
kubectl create -f deploy-redis.yaml
sleep 5
kubectl create -f .

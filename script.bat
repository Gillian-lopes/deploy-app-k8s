echo "criando as imagens...."

docker build -t denilsonbonatti/projeto-backend:1.0 backend/.
docker build -t denilsonbonatti/projeto-database:1.0 database/.

echo "Realizando pussh das imagens..."

docker push denilsonbonatti/projeto-backend:1.0
docker push denilsonbonatti/projeto-database:1.0

echo "Criando serviços no cluste kubernetes..."

kubectl apply -f ./services.yml

echo "Crian os deplyments..."

kubectl apply -f ./deployment.yml
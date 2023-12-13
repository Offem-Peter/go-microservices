# Microservices using Golang

docker build -f service-name.dockerfile -t nesco/service-name:1.0.0 .

docker push nesco/service-name:1.0.0

docker swarm init

docker stack deploy -c swarm.yml myapp

docker service ls

docker service scale myapp_service-name=3

# Microservices using Golang

```
docker build -f service-name.dockerfile -t nesco/service-name:1.0.0 .
```

```
docker push nesco/service-name:1.0.0
```

```
docker swarm init
```

```
docker stack deploy -c swarm.yml myapp
```

```
docker service ls
```

```
docker service scale myapp_service-name=3
```

# To update a service (with no downtime)

```
docker build -f service-name.dockerfile -t nesco/service-name:1.0.1 .
```

```
docker push nesco/service-name:1.0.1
```

```
docker service scale myapp_service-name=2
```

```
docker service update --image nesco/service-name:1.0.1 myapp_service-name
```

# Roll back to previous version

```
docker service update --image nesco/service-name:1.0.0 myapp_service-name
```

# Scale down / Remove

```
docker service scale myapp_service-name=0
```

```
docker stack rm myapp
```

# To Entirely leave the Swarm

```
docker swarm leave --force
```

# To see service logs

```
docker service logs -f myapp_service-name
```

---

## Server config stuff

adduser microservice

usermod -aG sudo microservice

ufw allow ssh

ufw allow http

ufw allow https

ufw allow 2377/tcp

ufw allow 7946/tcp

ufw allow 7946/udp

ufw allow 4789/udp

ufw allow 8025/tcp

ufw enable

# see process

```
htop
```

# kubernetes/Kube Commands

```
minikube start
minikube start --nodes=2
```

```
minikube stop
```

```
minikube dashboard
```

```
minikube status
```

```
kubectl apply -f k8s
```

```
kubectl get pods
```

```
kubectl get svc
```

```
kubectl get deployments
```

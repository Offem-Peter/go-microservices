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

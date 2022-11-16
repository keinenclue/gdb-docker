# gdb-docker
A docker container containing the "Unischema" from the lecture "Grundlagen: Datenbanken" at TUM.

## Create and run the docker container
```
docker run --name gdb-docker -d -p 127.0.0.1:5432:5432 -p 127.0.0.1:8081:8081 ghcr.io/keinenclue/gdb-docker:latest
```

## Stop container
```
docker stop gdb-docker
```

## Run container again
This only works after the container has already been created
```
docker start gdb-docker
```

## Delete container
```
docker rm gdb-docker
```

## View logs
```
docker logs -f gdb-docker
```

# gdb-docker
A docker container containing the "Unischema" from the lecture "Grundlagen: Datenbanken" at TUM.  
The docker container also starts a [pgweb](https://github.com/sosedoff/pgweb/) SQL-webinterface on [locahost:8081](http://localhost:8081)

## Run local postgres database through docker
### Create and run the docker container
```
docker run --name gdb-docker -d -p 127.0.0.1:5432:5432 -p 127.0.0.1:8081:8081 ghcr.io/keinenclue/gdb-docker:latest
```

### Stop container
```
docker stop gdb-docker
```

### Run container again
This only works after the container has already been created
```
docker start gdb-docker
```

### Delete container
```
docker rm gdb-docker
```

### View logs
```
docker logs -f gdb-docker
```

## Use database through the webinterface
1. Open [localhost:8081](http://localhost:8081) in your browser
2. Start coding SQL :)

## Use database through [DataGrip](https://www.jetbrains.com/datagrip/)

1. Create new project
2. In the UI under **Database Explorer**: New(**+** Symbol) -> Data Source -> PostgreSQL
3. Change **User** to `postgres` (no password is needed)
4. Click **OK**
5. Select the **public** schema under postgres and click the reload button
6. Start coding SQL :)

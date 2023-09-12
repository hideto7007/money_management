# money_management


## お金管理アプリ

- docker command
```
docker build -t money .
docker container run -it -v C:\\Users\\81805\\share\\money_management:/money -p 8000:8000 --name money money

docker start money
docker container exec -it money /bin/bash
```

# money_management


## お金管理アプリ

- docker command
```
docker build -t money .
docker container run -it -v C:\\Users\\81805\\share\\money_management:/money -p 8000:8000 -p 5173:5173 --name money money

docker start money
docker container exec -it money /bin/bash
```

- typescript vue3 quasar環境構築
```
npm create vite@latest my-app -- --template vue-ts
npm install --save-dev @types/node@16
npm install quasar @quasar/extras
npm install -D @quasar/vite-plugin sass@1.32.13

```

- UIフレームワーク<br/>
https://quasar.dev/components

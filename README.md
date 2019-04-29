# caddy

> 基于 caddy 的前端代理

```shell
docker build -t shuxs/caddy:latest .
```

```shell
docker run -d -e API_ADDR=http://service:port -v path/to/www:/www -p 3000:80 shuxs/caddy:latest

docker run -d -v path/to/www:/www -p 3000:80 shuxs/caddy:latest /caddy.sh http://service:port
```

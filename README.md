# jaddy

> 基于 caddy 的前端代理

```shell
docker build -t shuxs/jaddy:latest .
```

```shell
docker run -d -e API_ADDR=http://service:port -v path/to/www:/www -p 3000:80 shuxs/jaddy:latest
```

FROM shuxs/alpine:latest

COPY caddy caddy.sh /

RUN chmod +x /caddy.sh

WORKDIR /

CMD [ "/caddy.sh" ]

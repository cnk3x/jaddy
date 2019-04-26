FROM shuxs/alpine:latest

WORKDIR /

ENV API_ADDR=http://server:port

EXPOSE 80

COPY jaddy entry_point.sh /

ENTRYPOINT [ "/entry_point.sh" ]

#!/bin/sh

if [[ -z ${API_ADDR} ]]; then
    echo need env APP_ADDR
    exit 1
fi

if [[ "${API_ADDR: -1}" == "/" ]]; then
    without="
        without /api"
fi

cat >Caddyfile <<EOF
:80 {
    root www
    proxy /api/ ${API_ADDR} {${without}
        header_upstream Host {host}
        header_upstream X-Real-IP {remote}
        header_upstream X-Forwarded-For {remote}
        header_upstream X-Forwarded-Port {server_port}
        header_upstream X-Forwarded-Proto {scheme}
        header_upstream Connection {>Connection}
        header_upstream Upgrade {>Upgrade}
        fail_timeout 10s
        try_duration 1s
        try_interval 250ms
        insecure_skip_verify
    }
    gzip
    rewrite {
        if {path} not_starts_with /api/
        to {path} /
    }
}
EOF

./jaddy

FROM caddy:builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/dynv6

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
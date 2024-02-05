FROM caddy:2.4.6

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

FROM caddy:2.4.6

COPY --from=0 /usr/bin/caddy /usr/bin/caddy
COPY ./Caddyfile /etc/caddy/Caddyfile
# FROM caddy:2.4.6

# RUN caddy-builder \
#     github.com/caddy-dns/cloudflare

# FROM caddy:2.4.6

# COPY --from=0 /usr/bin/caddy /usr/bin/caddy
# COPY ./Caddyfile /etc/caddy/Caddyfile

FROM caddy:2.7.6-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
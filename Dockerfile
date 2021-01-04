FROM caddy:2.2.1-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2


FROM caddy:2.2.1
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

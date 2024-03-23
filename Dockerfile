FROM caddy:2.7.6-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:2.7.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
RUN apk add --no-cache fail2ban

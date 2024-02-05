FROM php:8.1-cli AS build-env
COPY --chown=www:www . /var/www/html
WORKDIR /var/www/html

# Perform some other build steps, like "npm run prod" and "composer install"

FROM roelofjanelsinga/caddy-cloudflare:latest

COPY --from=build-env /var/www/html /var/www/html
COPY ./Caddyfile /etc/caddy/Caddyfile
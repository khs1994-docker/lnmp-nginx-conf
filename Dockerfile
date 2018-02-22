FROM khs1994/php-fpm:swarm-7.2.2-alpine3.7

FROM nginx:1.13.9-alpine

RUN rm -rf /etc/nginx/conf.d

COPY nginx.conf.default /etc/nginx/nginx.conf

COPY demo-php.conf /etc/nginx/conf.d/

COPY --from=0 /app /app

COPY wait-for-php.sh /wait-for-php.sh

CMD ["/wait-for-php.sh"]

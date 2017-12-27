FROM khs1994/php-fpm:swarm-7.2.0-alpine3.7

FROM nginx:1.13.8-alpine

RUN rm -rf /etc/nginx/conf.d

COPY php-demo.conf /etc/nginx/conf.d/

COPY --from=0 /app /app

COPY example/wait-for-php.sh /wait-for-php.sh

CMD ["/wait-for-php.sh"]

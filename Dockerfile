FROM khs1994/nginx:1.13.7-alpine

RUN rm -rf /etc/nginx/conf.d

COPY php-demo.conf /etc/nginx/conf.d/

FROM khs1994/nginx:1.13.7-alpine

COPY --from=0 /etc/nginx/conf.d /etc/nginx/conf.d

COPY wait-for-php.sh /wait-for-php.sh

CMD ["/wait-for-php.sh"]

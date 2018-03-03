FROM khs1994/php-fpm:swarm-7.2.2-alpine3.7

# FROM khs1994/nginx:1.13.9-tls1.3-stretch

# Debian 镜像缺少网络相关工具，这里为了方便测试 LinuxKit 继续使用 Alpine 镜像

FROM nginx:1.13.9-alpine

RUN rm -rf /etc/nginx/conf.d

ADD https://github.com/khs1994-docker/lnmp/blob/master/config/etc/nginx/nginx.production.conf /etc/nginx/nginx.conf

COPY demo-php.conf /etc/nginx/conf.d/

COPY --from=0 /app /app

COPY wait-for-php.sh /wait-for-php.sh

CMD ["/wait-for-php.sh"]

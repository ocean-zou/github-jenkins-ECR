FROM nginx

COPY vhost.conf /etc/nginx/conf.d/default.conf

CMD ["sh", "-c", "nginx -g 'daemon off;'"]

EXPOSE 80
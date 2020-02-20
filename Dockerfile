FROM alpine:3.9.5

RUN apk add --update supervisor \
    && mkdir -p /etc/supervisor/conf.d/ \
    && mkdir -p /var/log/supervisor/ \
    && apk add --no-cache bash \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && echo "Asia/Ho_Chi_Minh" > /etc/timezone \
    && touch /etc/crontabs/empty-logs \
    && crontab /etc/crontabs/empty-logs
ADD supervisord.conf /etc/
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

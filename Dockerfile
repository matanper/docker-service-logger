FROM debian

ENV INTERVAL 30

COPY docker-service-log /docker-service-log
COPY entrypoint /entrypoint

CMD sh /entrypoint

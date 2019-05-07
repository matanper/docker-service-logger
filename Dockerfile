FROM alpine

RUN apk --update --no-cache add docker

ENV INTERVAL 30

COPY docker-service-log /docker-service-log
COPY entrypoint /entrypoint

CMD sh /entrypoint

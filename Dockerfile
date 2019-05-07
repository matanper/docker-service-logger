FROM alpine

RUN apk --update --no-cache add docker

ENV INTERVAL 10

COPY docker-service-log /docker-service-log
COPY entrypoint /entrypoint

CMD /entrypoint

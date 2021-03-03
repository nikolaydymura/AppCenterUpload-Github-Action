FROM node:dubnium-alpine

WORKDIR /app
COPY . /app

RUN npm install -g appcenter-cli \
    && apk update \
    && apk add git \
    && apk add jq

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]


FROM node:14-alpine

RUN apk add --no-cache tini

WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm install

COPY app/ .

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["node", "server.js"]

EXPOSE 3000

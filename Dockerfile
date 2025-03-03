FROM madnificent/ember:3.26.1 as builder
LABEL maintainer="jan-pieter.baert@hotmail.com"

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN ember build -prod

FROM semtech/ember-proxy-service:1.4.0
COPY --from=builder /app/dist /app

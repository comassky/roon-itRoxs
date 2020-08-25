# syntax=docker/dockerfile:experimental
FROM node:alpine AS build
RUN apk add git
RUN git clone https://github.com/bsc101/roon-extension-itroxs.git
WORKDIR /roon-extension-itroxs
RUN npm install

FROM node:alpine
RUN addgroup -S itRox && adduser -S itRox -G itRox
RUN mkdir -p /app
COPY --from=build /roon-extension-itroxs /app
WORKDIR /app
EXPOSE 8090
USER itRox
ENTRYPOINT ["node", "."]


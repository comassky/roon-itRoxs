# syntax=docker/dockerfile:experimental
FROM node:alpine AS build
RUN apk add git
#RUN git clone https://github.com/bsc101/roon-extension-itroxs.git
RUN git clone -b wrapper https://github.com/bsc101/roon-extension-itroxs.git
WORKDIR /roon-extension-itroxs
RUN npm install

FROM node:alpine
RUN mkdir -p /app
COPY --from=build /roon-extension-itroxs /app
WORKDIR /app
EXPOSE 8090
ENTRYPOINT ["node", "."]


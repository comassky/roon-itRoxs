FROM node AS build
RUN apt update && apt install git -y
RUN git clone https://github.com/bsc101/roon-extension-itroxs.git
WORKDIR /roon-extension-itroxs
RUN npm install

FROM node:alpine
RUN mkdir -p /app
COPY --from=build /roon-extension-itroxs /app
WORKDIR /app
VOLUME /app
EXPOSE 8090
ENTRYPOINT ["node", "."]


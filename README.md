# roon-itRoxs
https://github.com/bsc101/roon-extension-itroxs : docker image

    docker run -d -p 8090:8090 --name itRoxs comassky/itroxs:latest



    version: '3.3'

    services:
      itRoxs:
        image: comassky/itroxs:latest 
        container_name: itRoxs 
        restart: unless-stopped 
        ports:
         - 8090:8090

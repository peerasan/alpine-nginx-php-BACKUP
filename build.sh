#!/bin/bash

docker stop pat-web
docker rm pat-web
docker rmi pat-web
docker build -t pat-web .
docker run --restart=always --name pat-web -p 80:80 -h nginx -d pat-web
docker exec -ti pat-web sh

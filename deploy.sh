#!/usr/bin/env bash
docker build -t alexvak/devconnector-client:latest -t alexvak/devconnector-client:$SHA -f ./client/Dockerfile ./client
docker build -t alexvak/devconnector-server:latest -t alexvak/devconnector-server:$SHA -f ./server/Dockerfile ./server

docker push alexvak/devconnector-client:latest
docker push alexvak/devconnector-server:latest

docker push alexvak/devconnector-client:$SHA
docker push alexvak/devconnector-server:$SHA

kubectl apply -f k8s

kubectl set image deployments/devconnector-client-deployment devconnector-client=alexvak/devconnector-client:$SHA
kubectl set image deployments/devconnector-server-deployment devconnector-server=alexvak/devconnector-server:$SHA
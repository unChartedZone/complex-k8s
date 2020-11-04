docker build -t unChartedZone/multi-client -f ./client/Dockerfile ./client
docker built -t unChartedZone/multi-server -f ./server/Dockerfile ./server
docker build -t unChartedZone/multi-worker -f ./worker/Dockerfile ./worker

docker push unChartedZone/multi-client
docker push unChartedZone/multi-server
docker push unChartedZone/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment=unChartedZone/multi-server
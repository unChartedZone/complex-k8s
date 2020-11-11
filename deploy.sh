docker build -t unChartedZone/multi-client:latest -t unChartedZone/multi-client:$SHA -f ./client/Dockerfile ./client
docker built -t unChartedZone/multi-server:latest -t unChartedZone/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t unChartedZone/multi-worker:latest -t unChartedZone/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push unChartedZone/multi-client:latest
docker push unChartedZone/multi-server:latest
docker push unChartedZone/multi-worker:latest

docker push unChartedZone/multi-client:$SHA
docker push unChartedZone/multi-server:$SHA
docker push unChartedZone/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=unChartedZone/multi-server:$SHA
kubectl set image deployments/client-deployment client=unChartedZone/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=unChartedZone/multi-worker:$SHA
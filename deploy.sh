docker build -t unchartedzone/multi-client:latest -t unchartedzone/multi-client:$SHA -f ./client/Dockerfile ./client
docker built -t unchartedzone/multi-server:latest -t unchartedzone/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t unchartedzone/multi-worker:latest -t unchartedzone/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push unchartedzone/multi-client:latest
docker push unchartedzone/multi-server:latest
docker push unchartedzone/multi-worker:latest

docker push unchartedzone/multi-client:$SHA
docker push unchartedzone/multi-server:$SHA
docker push unchartedzone/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=unchartedzone/multi-server:$SHA
kubectl set image deployments/client-deployment client=unchartedzone/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=unchartedzone/multi-worker:$SHA

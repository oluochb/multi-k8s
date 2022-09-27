docker build -t brainece/multi-client:latest -t brainece/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t brainece/multi-server:latest -t brainece/multi-client:$SHA -f ./server/Dockerfile ./server
docker build -t brainece/multi-worker:latest -t brainece/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push brainece/multi-client:latest
docker push brainece/multi-server:latest
docker push brainece/multi-worker:latest

docker push brainece/multi-client:$SHA
docker push brainece/multi-server:$SHA
docker push brainece/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=brainece/multi-server:$SHA
kubectl set image deployments/client-deployment client=brainece/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=brainece/multi-worker:$SHA
 


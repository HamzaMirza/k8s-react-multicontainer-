docker build -t hamza156/docker-react-app-client-image:latest -t hamza156/docker-react-app-client-image:$SHA -f ./client/dockerfile ./client
docker build -t hamza156/docker-react-app-server-image:latest -t hamza156/docker-react-app-server-image:$SHA -f ./server/dockerfile ./server
docker build -t hamza156/docker-react-app-worker-image:latest -t hamza156/docker-react-app-worker-image:$SHA -f ./worker/dockerfile ./worker  

docker push hamza156/docker-react-app-client-image:latest
docker push hamza156/docker-react-app-server-image:latest
docker push hamza156/docker-react-app-worker-image:latest

docker push hamza156/docker-react-app-client-image:$SHA
docker push hamza156/docker-react-app-server-image:$SHA
docker push hamza156/docker-react-app-worker-image:$SHA

kubectl apply -f configurations

kubectl set image deployments/server-deployment server=hamza156/docker-react-app-client-image:$SHA
kubectl set image deployments/server-deployment server=hamza156/docker-react-app-server-image:$SHA
kubectl set image deployments/server-deployment server=hamza156/docker-react-app-worker-image:$SHA
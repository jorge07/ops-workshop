# Build image
`docker build -t app:hello .`

# Analyse the results
`docker image inspect app:hello`

# Deploy to Minikube

`minikube start`
`eval $(minikube docker-env)`

This will point your docker client to Minikube. You must rebuild the image. `docker images` <- K8s stuff

# Build image

`docker build -t app:hello`

## Deploy

`kubectl apply -f deploy/`

`kubectl get po,deploy,svc`

`minikube service my-app`

# Update 

Update your code 

`docker build -t app:hello-x`

Edit deploy to update image tag

`kubectl apply -f deploy/`

## Remove 

`kubectl delete -f deploy/`

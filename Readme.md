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

# Helming

```bash
kubectl delete -f deploy
cd deploy
helm create chart
cd chart
ls
helm template .
```

`helm template --set image.tag=demo .`

## Deploy with helm

`helm init`

`kubectl describe deploy tiller-deploy -n kube-system`
`kubectl get po -l app=helm -n kube-system`

`helm install --name my-app .`
`helm ls`
`helm history my-app`

## Update deployment

`helm upgrade my-app --set image.tag=hello .`
`helm upgrade my-app -f ../dev/dev.yaml .`

# Working with helm dependencies

Create `requirement.yaml`

Update deps:

`helm dependency update`

Deploy our redis cluster:

`helm upgrade my-app -f deploy/dev/dev.yaml deploy/chart`

# Pro Tip:

Kubernetes mount secrets and config maps as volumes. 
It means changing a those, your APP values will not change unless you deploy again.
Add a checksum of the file to trigger a deploy each time it change.
```yaml
annotations:
  checksum/configmap: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
```

# Delete all

`helm delete --purge my-app`

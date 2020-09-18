### Create Custom Resource Definitions for cert-manager
```
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
```

## Helm Chart
### 1. Installation
```
helm dependency update ./cert-manager
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
```

### 1. Upgradation
```
helm upgrade security ./cert-manager -i -n cert-manager --set external-dns.aws.credentials.accessKey=<access_key>,external-dns.aws.credentials.secretKey=<secret_key>,letsencrypt.staging=true,letsencrypt.email=<email>,external-dns.zoneIdFilters[0]=<zoneId>,external-dns.domainFilters[0]=<domain> --set nginx-ingress.controller.replicaCount=1,nginx-ingress.controller.service.annotations."external-dns\.alpha\.kubernetes\.io/hostname"=<domain>
```


### 2. Deletion
```
helm delete security -n cert-manager
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
kubectl delete CustomResourceDefinition virtualservers.k8s.nginx.org
kubectl delete CustomResourceDefinition virtualserverroutes.k8s.nginx.org
kubectl delete ns cert-manager
```

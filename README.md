# ArgoCD setup with Microconfig Server

## Installation
* Install [ArgoCD](https://argoproj.github.io/argo-cd/getting_started/)
* Build custom ArgoCD repo docker image with microctl included (docker/argocd) and use it in `argocd-repo-server` deployment
* Register custom `microctl` plugin (manifests/argocd/cm.yaml)
* Deploy microconfig-server via [helm-char](https://github.com/microconfig/microconfig-server-helm) with custom values (manifests/microconfig-server/values.yaml)
* create `dev` and `prod` namespaces
* add example apps (manifests/apps)

## Test
You will see that argo deploys 4 example apps configured in [config-repo](https://github.com/microconfig/microconfig-argocd-configs)
* dev-backend
* dev-frontend
* prod-backend
* prod-frontend

Apps are just `alpine` (dev) and `centos` (prod) pods that fetch simple configuration via `microctl` init container, output it to stdout and sleep.

## Details
ArgoCD tracks this repo for application versions via `applications/*` folders.
On `tag.yaml` change ArgoCD is configured via custom plugin to fetch `helm` values for app/env via `microctl` and then uses `helm template` to generate manifests.
So deploy configuration is managed by Microconfig and ArgoCD just tracks this repo for app versions.
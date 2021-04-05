set -e

export TAG=0.5.0

docker build -t microconfig/argocd:"$TAG" -t microconfig/argocd:latest .
docker push microconfig/argocd:"$TAG"
docker push microconfig/argocd:latest

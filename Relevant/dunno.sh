#!/bin/bash
export JAVA_HOME="/usr/lib/jvm/default-java"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubern$
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
echo "done" >> /opt/step1
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
echo "done" >> /opt/step2
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr$
echo "done" >> /opt/step3
wget https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz
tar -zxvf helm-v3.4.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
echo "done" >> /opt/step4
kind create cluster --config /root/kind-config.yaml
echo "done" >> /opt/step5
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/depl$
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
kubectl apply -f /root/ingress-config.yaml
echo "done" >> /opt/step6
wget https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz
tar -zxvf helm-v3.4.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
echo "done" >> /opt/step4

![Logo-jenkins](https://www.jenkins.io/images/logos/clown/clown.png)

## Introduction 
>In this project i'm working on the pipeline using Ansible, kubernetes and jenkins. I'm planning to 
improve this project by make it become a full CI/CD project, but it takes time for as i learn and do 
at the same time.


## Setup Ansible on Agent
```
apt update
apt install software-properties-common -y
add-apt-repository --yes --update ppa:ansible/ansible
apt install -y ansible
```
## Setup kubernetes plugin for Ansible
```
apt install python3-pip -y
pip3 install kubernetes
echo "[inventory]" >> /etc/ansible/ansible.cfg
echo "enable_plugins = kubernetes.core.k8s" >> /etc/ansible/ansible.cfg
```
## Setup nginx ingress
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace default
kubectl get service ingress-nginx-controller --namespace=default
```
## Generate Private Key and CSR
```
openssl req -newkey rsa:2048 -nodes -keyout tls.key -out tls.csr
```
## Create Self-Signed Certificate
```
openssl x509 -req -sha256 -days 365 -in tls.csr -signkey tls.key -out tls.crt
```
## Store Certificate in Kubernetes Secret
```
kubectl create secret tls my-certificate --cert=tls.crt --key=tls.key
```
## Encode certifcate to base64
```
cat /path/to/tls.crt | base64
cat /path/to/tls.key | base64
```

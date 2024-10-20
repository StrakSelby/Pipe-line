![Logo-jenkins](https://www.jenkins.io/images/logos/clown/clown.png)

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
## Setup java jdk for Agent
```
apt update
apt install fontconfig openjdk-17-jre
```
## Setup kubectl for Agent
```
snap install kubectl --classic
kubectl version --client
snap connect doctl:kube-config
```
## Setup doctl for Digital-Ocean cluster and Authentication
```
apt update
apt install snapd
snap install doctl
doctl auth init
```
## Setup nginx ingress
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace ingress-nginx
kubectl get service ingress-nginx-controller --namespace=ingress-nginx
```
## Generate Private Key and CSR
```
openssl req -newkey rsa:2048 -nodes -keyout tls.key -out tls.csr
```
## Create Self-Signed Certificate
```
openssl x509 -req -sha256 -days 365 -in tls.csr -signkey tls.key -out tls.crt
```
## Encode certifcate to base64
```
cat /path/to/tls.crt | base64
cat /path/to/tls.key | base64
```

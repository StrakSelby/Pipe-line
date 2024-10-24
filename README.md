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
## Install and setup Helm
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
## Adding the prometheus Helm Repository
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```
## install and delete the kube-prometheus-stack using Helm
```
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -f kubernetes/helm/custom-values.yml -n ingress-nginx
helm delete kube-prometheus-stack -n ingress-nginx
```
## Access Prometheus and Grafana
```
http://<PUBLIC-IP or DOMAIN-NAME>:30090 -> Prometheus
http://<PUBLIC-IP or DOMAIN-NAME>:<Random-Port> -> Grafana
```
## Grafana admin user and password
```
kubectl get secret --namespace ingress-nginx kube-prometheus-stack-grafana -o jsonpath="{.data.admin-user}" | base64 --decode ; echo admin
kubectl get secret --namespace ingress-nginx kube-prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo prom-operator
```
## Create telegram bot for alert message 
```
1.Search for the "BotFather" in Telegram.
2.Start a chat and use the command /newbot to create a new bot.
3.name your bot and get the token. -> https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
```
## Redeploy helm for alert message
```
helm upgrade kube-prometheus-stack prometheus-community/kube-prometheus-stack -f alert-manager.yml -n ingress-nginx --reuse-values
```
## Apply the alert rule and test the rule 
```
kubectl apply -f alert-rules.yml
kubectl get prometheusrules -n ingress-nginx
kubectl run nginx-pod --image=nginx:lates3 --namespace=ingress-nginx
```

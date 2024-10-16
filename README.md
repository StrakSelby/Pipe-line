![logo-kubernetes](https://kangaroot.net/sites/default/files/media/images/2021-06/Kubernetes_icon.png)
![Logo-jenkins](https://www.jenkins.io/images/logos/automotive/automotive.png)


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
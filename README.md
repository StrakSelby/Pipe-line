![logo-kubernetes](http://cdn.ocsinventory-ng.org/common/banners/banner300px.png)
![Logo-jenkins](https://w7.pngwing.com/pngs/829/527/png-transparent-computer-icons-jenkins-mauldin-jenkins-llc-head-communication-mauldin-jenkins-llc-thumbnail.png)
![logo-docker](https://w7.pngwing.com/pngs/237/269/png-transparent-docker-logo-docker-logo-kubernetes-software-deployment-engineer-logo-logo-area-line-thumbnail.png)

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
kubectl:
	export KUBECONFIG=/home/cluster-kubeconfig.yaml
	kubectl config current-context
	kubectl --kubeconfig=/home/cluster-kubeconfig.yaml get nodes

deploy-service:
	kubectl apply -f kubernetes/volume/mariadb-configmap.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/volume/nginx-configmap.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/volume/wordpress-configmap.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/volume/mariadb-volume.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/volume/mariadb-secret.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/volume/certificate-secret.yml --namespace=ingress-nginx

deployment:
	kubectl apply -f kubernetes/deployment/nginx-deployment.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/deployment/mariadb-deployment.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/deployment/wordpress-deployment.yml --namespace=ingress-nginx
	kubectl apply -f kubernetes/deployment/ingress-deployment.yml --namespace=ingress-nginx
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml

delete:
	kubectl delete -f kubernetes/deployment/nginx-deployment.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/deployment/mariadb-deployment.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/deployment/wordpress-deployment.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/deployment/ingress-deployment.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/mariadb-configmap.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/nginx-configmap.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/wordpress-configmap.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/mariadb-secret.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/mariadb-volume.yml --namespace=ingress-nginx
	kubectl delete -f kubernetes/deployment/ingress-deployment.yml --namespace=ingress-nginx
	kubectl delete deployment ingress-nginx-controller --namespace=ingress-nginx
	kubectl delete -f kubernetes/volume/certificate-secret.yml --namespace=ingress-nginx


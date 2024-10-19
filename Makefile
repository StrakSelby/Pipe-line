kubectl:
	export KUBECONFIG=/home/cluster-kubeconfig.yaml
	kubectl config current-context
	kubectl --kubeconfig=/home/cluster-kubeconfig.yaml get nodes

deploy-service:
	kubectl apply -f kubernetes/volume/mariadb-configmap.yml
	kubectl apply -f kubernetes/volume/nginx-configmap.yml
	kubectl apply -f kubernetes/volume/wordpress-configmap.yml
	kubectl apply -f kubernetes/volume/mariadb-volume.yml
	kubectl apply -f kubernetes/volume/mariadb-secret.yml

deployment:
	kubectl apply -f kubernetes/deployment/nginx-deployment.yml
	kubectl apply -f kubernetes/deployment/mariadb-deployment.yml
	kubectl apply -f kubernetes/deployment/wordpress-deployment.yml
	kubectl apply -f kubernetes/deployment/ingress-deployment.yml

delete:
	kubectl delete -f kubernetes/deployment/nginx-deployment.yml
	kubectl delete -f kubernetes/deployment/mariadb-deployment.yml
	kubectl delete -f kubernetes/deployment/wordpress-deployment.yml
	kubectl delete -f kubernetes/deployment/ingress-deployment.yml
	kubectl delete -f kubernetes/volume/mariadb-configmap.yml
	kubectl delete -f kubernetes/volume/nginx-configmap.yml
	kubectl delete -f kubernetes/volume/wordpress-configmap.yml
	kubectl delete -f kubernetes/volume/mariadb-secret.yml
	kubectl delete -f kubernetes/volume/mariadb-volume.yml
	kubectl delete -f kubernetes/deployment/ingress-deployment.yml

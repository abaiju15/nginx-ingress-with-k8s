.PHONY: build clean

build:
	kubectl apply -f storage/pv-volume.yaml
	kubectl apply -f storage/pv-claim.yaml
	kubectl apply -f alpine-nginx/app-deployment.yaml
	kubectl apply -f alpine-nginx/nodeport.yaml
	kubectl apply -f k8s-proxy/service-account.yaml
	kubectl apply -f k8s-proxy/k8s-proxy.yaml

clean:
	kubectl delete deploy nginx-k8s
	kubectl delete persistentvolume task-pv-volume
	kubectl delete persistentvolumeclaim task-pv-claim

DEFAULT: build
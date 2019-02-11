
docker build   kubernetes_django -t gitumarkk/k8_django_minikube:1.0.0
docker tag gitumarkk/k8_django_minikube:1.0.0 localhost:32000/gitumarkk/k8_django_minikube:1.0.0
docker push localhost:32000/gitumarkk/k8_django_minikube:1.0.0


microk8s.kubectl apply -f config/deployment.yml
microk8s.kubectl expose deployment django --type=NodePort

-microk8s.kubectl delete -f config/deployment.yml

microk8s.kubectl apply -f config/service.yml


openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=localhost" -days 365
kubectl create secret tls test-localhost --cert=tls.crt --key=tls.key
minikube ip
curl -k --header host:localhost https://192.168.42.131

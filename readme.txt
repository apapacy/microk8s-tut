
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



= nomad

consul agent -server -client 127.0.0.1 -advertise 127.0.0.1 -data-dir /tmp/consul -ui -bootstrap

http://127.0.0.1:8500/ui/dc1/services

nomad agent --config nomad/nomad.conf

docker build django/ -t apapacy/tut-django:1.0.1

nomad job run nomad/django.conf

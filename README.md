## Minikube deployment instructions

### 1. Start minikube
    minikube start --cpus=max --memory=max --vm-driver=docker

    kubectl proxy --address='0.0.0.0' --port=8080 --disable-filter=true


### 2. Load files from /helm
    kubectl apply -f helm

### 3. Пробрасываем порты на локальный хост, если требуется подключиться к бд/брокеру с локальной машины
    kubectl port-forward svc/postgresql 14105:5432
    kubectl port-forward svc/redis 6379:6379
    kubectl port-forward svc/kafka-ui 8080:8080
    kubectl port-forward svc/kafka 29092:29092
    kubectl port-forward -n kafka svc/kafka-ui 8080:8080

### 4. Запуск кафки
    kubectl create namespace kafka
    kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-single-node.yaml -n kafka
    kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka 

### 5.
    kubectl exec -it -n backend deploy/note-flow -- /bin/bash
    alembic upgrade head

### 6. Рестарт пода
    kubectl rollout restart deployment note-flow -n backend

### 7. Открытия порта наружу из docker сети
     sudo minikube tunnel


### 8. 
    eval $(minikube docker-env)
    docker build -t note-flow:latest .
migrations:
	kubectl exec -it -n backend deploy/note-flow -- alembic upgrade head
	kubectl exec -it -n backend deploy/auth -- alembic upgrade head

deploy:
    kubectl apply -f k8s

create_topics:
    kubectl apply -f k8s/kafka-topics-job.yaml

create_db:
    kubectl apply -f k8s/job-create-db.yaml



docker run -d -p 8080:8080 --name go_tutorial gcr.io/$PROJECT_ID/godocker:v8




docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder gcr.io/jntlserv0/godocker:v4






gcloud docker push gcr.io/$PROJECT_ID/godocker:v4

 gcloud container clusters create hello-world

kubectl run godocker --image=gcr.io/$PROJECT_ID/godocker:v4 --port=8080


kubectl expose deployment godocker --type="LoadBalancer"

 kubectl scale deployment godocker --replicas=4

docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder gcr.io/jntlserv0/godocker:v5

gcloud docker push gcr.io/$PROJECT_ID/godocker:v5

kubectl set image deployment/godocker godocker=gcr.io/$PROJECT_ID/godocker:v5


docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder gcr.io/jntlserv0/godocker:v6

gcloud docker push gcr.io/$PROJECT_ID/godocker:v6
kubectl set image deployment/godocker godocker=gcr.io/$PROJECT_ID/godocker:v6


docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder gcr.io/jntlserv0/godocker:v7
gcloud docker push gcr.io/$PROJECT_ID/godocker:v7
kubectl set image deployment/godocker godocker=gcr.io/$PROJECT_ID/godocker:v7

docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder gcr.io/jntlserv0/godocker:v8
gcloud docker push gcr.io/$PROJECT_ID/godocker:v8
kubectl set image deployment/godocker godocker=gcr.io/$PROJECT_ID/godocker:v8



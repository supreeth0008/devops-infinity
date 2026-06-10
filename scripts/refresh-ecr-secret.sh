#!/bin/bash
kubectl delete secret ecr-secret -n devops-infinity 2>/dev/null || true
kubectl create secret docker-registry ecr-secret \
  --namespace devops-infinity \
  --docker-server=499290259342.dkr.ecr.ap-south-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region ap-south-1)
kubectl rollout restart deployment/devops-infinity -n devops-infinity
echo "ECR secret refreshed"

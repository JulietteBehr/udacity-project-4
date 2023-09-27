#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=jcbehr/project-app

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment project-app --image=$dockerpath
kubectl run project-app\
    --image=$dockerpath\
    --port=80 --labels app=project-app


# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/project-app 8000:80
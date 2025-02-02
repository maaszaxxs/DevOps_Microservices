#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath='maaszaxxs/devops1234'

# Step 2:
# Run the Docker Hub container with kubernetes
kubectl run predictor --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods
sleep 30
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward predictor 8000:80

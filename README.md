[![maaszaxxs](https://circleci.com/gh/maaszaxxs/DevOps_Microservices.svg?style=svg)](https://app.circleci.com/pipelines/github/maaszaxxs/DevOps_Microservices)

## Project Overview

In this project, you will operationalize a Machine Learning Microservice API.

 This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls.

## Project Tasks

 In this project you will:
* Test your project code using linting
* Deploy your containerized application using Docker and make a prediction
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction

---
## Project Steps

### 1. Setup the Environment

* Create a virtualenv, `.devops`, with command `make setup` it runs the command below:
```bash
python3 -m virtualenv --python=<path-to-Python3.7> .devops
```
* Activate the virtualenv, `.devops`, with command:
```bash
 source .devops/bin/activate
 ```
* Run `make install` to install the necessary dependencies in the `requirements.txt` & install hadolint using the `Makefile` commands:
```bash
pip install --upgrade pip &&\
  pip install -r requirements.txt
# Install hadolint
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
  sudo chmod +x /bin/hadolint
```
* Install minikube using the commands:
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
* (Optional) You can create a symbolic link to minikube’s binary named ‘kubectl’:
```bash
ln -s $(which minikube) /usr/local/bin/kubectl
```

### 2. Containerize the Application using Docker

* The `Dockerfile` creates a working_directory `/app/`, copies the `app.py` to `/app/`, exposes port `80` and sets up the CMD to run `app.py` with a python interpreter when the container runs.

* Run `make lint` to lint the `Dockerfile`and `app.py`.

* Run `run_docker.sh` that builds a docker image tagged `predictor`, lists the docker images and runs `predictor`in a docker container.

* Run `make_prediction.sh` in a separate terminal to make the prediction.

* Run `upload_docker.sh` to tag and push the docker image created before to Docker Hub. You should change the variable `dockerpath` to your own account.

### 3. Configure & Create Kubernetes Cluster

* Start the minikube cluster using the command `minikube start`.

* Run `run_kubernetes.sh` that will deploy our docker image from docker hub to a minikube cluster, display the running pods and port forward port `8000` to `80`.

* Run `make_prediction.sh` in a separate terminal to make the prediction.

* (Optional) You can delete the cluster using `minikube delete` or stop the cluster using `minikube stop` to conserve resources.

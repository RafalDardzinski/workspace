base_IMAGE := workspace-base
base_CONTAINER := ws_base

python_IMAGE := workspace-python
python_CONTAINER := ws_python

PROJECTS_DIR ?= ~/Projects

.PHONY: build-base build-python
build-base:
	podman build --format docker -f images/base-workspace/Containerfile -t workspace-base --build-arg USERNAME=$$(whoami) --build-arg UID=$$(id -u) --build-arg GID=$$(id -g) .

build-python:
	podman build -f images/python-workspace/Containerfile -t workspace-python --build-arg USERNAME=$$(whoami) .

.PHONY: run-% start-%
run-%: build-%
	podman run --name $($*_CONTAINER) --replace --userns=keep-id -v $(PROJECTS_DIR):/home/$$(whoami)/Projects -it $($*_IMAGE)
	
start-%: 
	podman start -ai $($*_CONTAINER)

WORKSPACE=result
DOCKER_USER_DESCRIPTION=-e "_USER=$(shell id -nu)" -e "_UID=$(shell id -u)" -e "_GID=$(shell id -g)"
DOCKER_WORKSPACE_DESCRIPTION=-e "WORKSPACE=$(WORKSPACE)" -v $(PWD)/$(WORKSPACE):/$(WORKSPACE)

all:
	mkdir -p $(WORKSPACE)
	docker run $(DOCKER_WORKSPACE_DESCRIPTION) $(DOCKER_USER_DESCRIPTION) -it docker_test bash

image :
	docker build . -t docker_test


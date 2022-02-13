default: help

CURRENT_IMAGE_VERSION=2.2.0
MUTMUT_IMAGE_NAME=islomar/mutmut

help: ## Print this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

docker-lint: ## Apply a linter to the Dockerfile
	docker run --rm -i hadolint/hadolint < Dockerfile

docker-scan: ## Scan the Docker images (with Snyk)
	docker scan ${MUTMUT_IMAGE_NAME}:${CURRENT_IMAGE_VERSION}
	docker scan ${MUTMUT_IMAGE_NAME}:latest

build: docker-lint ## Build a new Docker image
	DOCKER_BUILDKIT=1 docker build . -t mutmut-dockerized

tag-docker-image: build ## Tag a new Docker image
	docker image tag mutmut-dockerized ${MUTMUT_IMAGE_NAME}:${CURRENT_IMAGE_VERSION}
	docker image tag mutmut-dockerized ${MUTMUT_IMAGE_NAME}:latest

docker-login: ## Login in Docker in order to be able to push a new Docker image to Docker Hub
	docker login --username islomar # This will prompt to request the password

publish-new-image: tag-docker-image docker-login ## Tag and publish a new Docker image
	docker image tag xdotool-dockerized ${MUTMUT_IMAGE_NAME}:${CURRENT_IMAGE_VERSION}
	docker image tag xdotool-dockerized ${MUTMUT_IMAGE_NAME}:latest
	docker image push ${MUTMUT_IMAGE_NAME}:${CURRENT_IMAGE_VERSION}
	docker image push ${MUTMUT_IMAGE_NAME}:latest

mutmut-help: ## Show the mutmut help
	docker run --rm mutmut-dockerized mutmut --help

mutmut-connect: ## Connect to the mutmut container
	docker run --rm -it mutmut-dockerized sh

mutmut-run: ## Run mutmut against the internal example
	docker run --rm mutmut-dockerized sh run-and-show.sh

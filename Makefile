PROJECT=notification-service
ORGANIZATION=smartcentrix
DOCKER_REPO = $(ORGANIZATION)/$(PROJECT)
VERSION_TAG = 0.0.1

.PHONY: build proto

build:
	docker build -t $(DOCKER_REPO):$(VERSION_TAG) .

push: build
	docker push $(DOCKER_REPO):$(VERSION_TAG)
	docker tag $(DOCKER_REPO):$(VERSION_TAG) $(DOCKER_REPO):latest
	docker push $(DOCKER_REPO):latest

proto:
	protoc -I . \
	  -I $(GOPATH)/src \
	  -I $(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
	  -I /usr/local/include \
	  --go_out=Mgoogle/api/annotations.proto=github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis/google/api,plugins=grpc:. \
	  ./notification/*.proto
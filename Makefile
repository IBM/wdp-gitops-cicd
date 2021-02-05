



clone-tag: ## Clone 'TAG' version from 
clone-tag: TAG=v0.0.1
clone-tag: TARGETDIR=src/serving
clone-tag: SOURCE=git@github.com:IBM/ibm-cloud-dublin-meetup.git
clone-tag:
	-rm -fr $(TARGETDIR)
	git clone -b '$(TAG)' --single-branch --depth 1 $(SOURCE) $(TARGETDIR)
	echo $(TAG) > $(TARGETDIR)/VERSION


build: ## Builds the docker image for the service
build: TAG=latest
	docker --debug build -t wdp-test:$(TAG) .


push: ## Pushes image to registry
push: TAG=latest
	echo 'Pushes image to the private docker registry registry'
	docker tag wdp-test:$(TAG) $(DOCKER_REGISTRY_URL)/$(NAMESPACE)/:wdp-test:$(TAG)
	docker push $(DOCKER_REGISTRY_URL)/$(NAMESPACE)/:wdp-test:$(TAG)

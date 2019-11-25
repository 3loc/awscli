NAMESPACE := 3loc
IMAGE_NAME := awscli
VERSION := 1.16.283

.PHONY : build rebuild push run dry install uninstall

build :
	docker build --build-arg VERSION=${VERSION} -t ${NAMESPACE}/${IMAGE_NAME}:${VERSION} -t ${NAMESPACE}/${IMAGE_NAME}:latest .

rebuild :
	docker build --no-cache -t ${NAMESPACE}/${IMAGE_NAME}:${VERSION} -t ${NAMESPACE}/${IMAGE_NAME}:latest .

push :
	docker push ${NAMESPACE}/${IMAGE_NAME}

run :
	docker run \
		--rm \
		-it \
		-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
		-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ${NAMESPACE}/${IMAGE_NAME}

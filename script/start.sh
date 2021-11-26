IMAGE_NAME="tracking-cryptocurrency-v1"
CONTAINER_NAME="tracking-cryptocurrency"

if docker ps --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}\$"; then
	docker rm -f $(docker ps -f name=$CONTAINER_NAME -q)
else
	docker build . -t ${IMAGE_NAME}
	docker run --name ${CONTAINER_NAME} -d -p 3000:3000 ${IMAGE_NAME} 
fi
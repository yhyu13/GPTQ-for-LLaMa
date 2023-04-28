docker build --network host -t gptq-llama-cuda .
docker run gptq-llama-cuda
docker ps -all

DOCKER_CONTAINER_ID=$(docker ps -all -q | head -n 1)
# Then find the docker Container ID and
docker cp $DOCKER_CONTAINER_ID:/result .
docker stop $DOCKER_CONTAINER_ID
docker rm $DOCKER_CONTAINER_ID
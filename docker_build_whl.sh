#!/bin/bash

# fill in the cuda arch list
TORCH_CUDA_ARCH_LIST="8.6"

docker build --build-arg TORCH_CUDA_ARCH_LIST=$TORCH_CUDA_ARCH_LIST --no-cache --network host -t gptq-llama-cuda .
docker run -d --name gptq-llama-cuda-container gptq-llama-cuda
docker ps -all

DOCKER_CONTAINER_ID=$(docker ps -aqf "name=gptq-llama-cuda-container")
# Then find the docker Container ID and copy the result
docker cp $DOCKER_CONTAINER_ID:/result . && docker stop $DOCKER_CONTAINER_ID && docker rm $DOCKER_CONTAINER_ID
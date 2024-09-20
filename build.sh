# build a docker image from Dockerfile
docker buildx build --platform linux/arm64 -t wicos/webd-arm64 .
# expected a node v14.20.0
# build angular app
IMAGE_UI=oreynaldocl/ang-node-ui

VERSION=2

echo $VERSION
cd app-ui
npm i
npm run build:prod
docker build -t $IMAGE_UI:$VERSION -f Dockerfile-dev .
docker tag $IMAGE_UI:$VERSION $IMAGE_UI:latest
docker push $IMAGE_UI:$VERSION
docker push $IMAGE_UI:latest

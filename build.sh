# expected a node v14.20.0
# build angular app
IMAGE_UI=oreynaldocl/ang-node-ui
IMAGE_API=oreynaldocl/ang-node-api

VERSION=1

echo $VERSION
cd app-ui
npm i
npm run build:prod
docker build -t $IMAGE_UI:$VERSION -f Dockerfile-dev .
docker tag $IMAGE_UI:$VERSION $IMAGE_UI:latest
docker push $IMAGE_UI:$VERSION
docker push $IMAGE_UI:latest
cd ..

cd api
docker build -t $IMAGE_API:$VERSION -f Dockerfile-dev .
docker tag $IMAGE_API:$VERSION $IMAGE_API:latest
docker push $IMAGE_API:$VERSION
docker push $IMAGE_API:latest

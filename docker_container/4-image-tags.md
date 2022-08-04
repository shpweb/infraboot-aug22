# give version to hello-world-nodejs

```s
# version your image at build time
$ docker build -t hello-world-nodejs:v1.0.0 .

# post build rename your image if needed (retag images as many version as needed)
$ docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
$ docker tag hello-world-nodejs:v1.0.0 sunitparekh/hello-world-nodejs:v1.0.0


# how to tag image with build number or git sha
$ export GIT_COMMIT=$(git log -1 --format=%h)
$ docker build -t sunitparekh/hello-world-nodejs:v1.0.0-$GIT_COMMIT .

# tagging image for deployment
$ docker tag sunitparekh/hello-world-nodejs:latest sunitparekh/hello-world-nodejs:sit
$ docker tag sunitparekh/hello-world-nodejs:sit sunitparekh/hello-world-nodejs:qa
$ docker tag sunitparekh/hello-world-nodejs:qa sunitparekh/hello-world-nodejs:uat

# push to docker registry
$ docker login
$ docker push sunitparekh/hello-world-nodejs:v1.0.0

```
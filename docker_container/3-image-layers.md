# show image layers for hello-world application

```s
$ docker build -t hello-world-nodejs .
$ docker images
$ docker history hello-world-nodejs

# change source code

$ docker build -t hello-world-nodejs .
$ docker images
$ docker history hello-world-nodejs

# now change Dockerfile to copy just package*.json file first before npm install

$ docker build -t hello-world-nodejs-optimized .
$ docker images
$ docker history hello-world-nodejs-optimized

#show difference between 2 images history and layers


```
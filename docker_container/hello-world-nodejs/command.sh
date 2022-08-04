$ docker pull in28min/hello-world-nodejs:0.0.2
Error response from daemon: manifest for in28min/hello-world-nodejs:0.0.2 not found: manifest unknown: manifest unknown

$ docker pull in28min/hello-world-nodejs:0.0.2.RELEASE
0.0.2.RELEASE: Pulling from in28min/hello-world-nodejs
0362ad1dd800: Pull complete
dec995c1a874: Pull complete
5ec5eeebd97d: Pull complete
f3041c7bd80b: Pull complete
b6cd29cc2885: Pull complete
b77db640c516: Pull complete
be5feb85377a: Pull complete
Digest: sha256:2fa54f541a6f22616adfb19ea747a7551e5882a8a3d0e597343cc6e4ded8e2c3
Status: Downloaded newer image for in28min/hello-world-nodejs:0.0.2.RELEASE
docker.io/in28min/hello-world-nodejs:0.0.2.RELEASE

$ docker images
REPOSITORY                   TAG             IMAGE ID       CREATED          SIZE
mynginx                      latest          74f71310172d   16 minutes ago   135MB
nginx                        latest          fd2d3e51789e   3 days ago       135MB
in28min/hello-world-nodejs   0.0.2.RELEASE   524be0987afd   7 weeks ago      105MB

$ docker run -d -p 80:80 --name mynodejs in28min/hello-world-nodejs
Unable to find image 'in28min/hello-world-nodejs:latest' locally
docker: Error response from daemon: manifest for in28min/hello-world-nodejs:latest not found: manifest unknown: manifest unknown.
See 'docker run --help'.

$ docker run -d -p 80:80 --name mynodejs in28min/hello-world-nodejs:0.0.2.RELEASE
fead5488f68f582d9749757f0300cda383a600ea540eaef3e3811c2f7c87a294
root@Hardiks-MacBook-Pro Applications # docker ps
CONTAINER ID   IMAGE                                      COMMAND                  CREATED         STATUS         PORTS                          NAMES
fead5488f68f   in28min/hello-world-nodejs:0.0.2.RELEASE   "docker-entrypoint.s…"   4 seconds ago   Up 3 seconds   0.0.0.0:80->80/tcp, 5000/tcp   mynodejs


$ docker exec -it mynodejs /bin/bash
OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/bash": stat /bin/bash: no such file or directory: unknown


$ docker exec -it mynodejs sh
##inside hello-world-nodejs container### 

/app # ls
Dockerfile         index.js           node_modules       package-lock.json  package.json

/app # pwd
/app

/app # cat index.js
var express = require('express')
const process = require('process');

var expressapp = express()
expressapp.get('/', function (req, res) {
    res.send('{"message":"Hello World JavaScript v2"}')
})
expressapp.listen(5000, function () {
    console.log('Ready on port 5000!')
})

/* To Handle Ctrl C*/
process.on('SIGINT', function () {
    process.exit();
/app # cat package.json
{
  "name": "nodejs-hello-world",
  "version": "1.0.0",
  "description": "nodejs-hello-world",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Ranga",
  "dependencies": {
    "express": "^4.17.1"
  },
  "devDependencies": {
    "webpack": "^4.41.5"
  },
  "license": "MIT",
  "repository": {}
}
/app # cat Dockerfile
FROM node:8.16.1-alpine
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 5000
CMD node index.js

#ENTRYPOINT ["node", "index.js"]
#COPY package.json /app
/app #
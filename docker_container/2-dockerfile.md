# Image creation for existing docker container

```s
$ docker run -p 80:80 --name myweb -d nginx
$ docker exec -it myweb /bin/bash 
$ cd /usr/share/nginx/html
$ echo "Sunit Parekh" > test.html
$ exit
$ docker commit myweb mynginx:v1
$ docker run -p 81:80 --name myweb2 -d mynginx:v1
$ docker run -p 82:80 --name myweb2 -d nginx
```

# Dockerfile Creation for Node Application

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

```s
$ docker build -t hello-world-nodejs .
$ docker build -t hello-world-nodejs:v1 .
$ docker build -t hello-world-nodejs:v2 . -f Dockerfile
$ docker run -p 8080:8080 --name hello -d hello-world-nodejs 
$ docker ps -a
$ docker logs hello
$ docker exec -it hello /bin/sh
$ curl -i localhost:8080
$ docker history hello-world-nodejs
```













# minikube related commands

```s
$ eval $(minikube docker-env)
$ minikube ssh
$ minikube dashboard
```
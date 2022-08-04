#### dockerfile composition ### 

FROM openjdk:alpine  // image to build from		

// create and change directory inside image
WORKDIR /usr/app/src

// copy file(s) from host to image
[ADD/COPY] /src/path/from/host /dest/path/to/image 

// pass environment variables to image
ENV key value

// executes command(s) as new layer, used to install softwares
RUN apt-get install python3 git 

// ONLY FOR DOCUMENTATION PURPOSE
EXPOSE 8080 9009	

// configures a container that runs as an executable, main process start
[CMD/ENTRYPOINT] ["executable", "param1", "param2", ...] 



#### dockerfile sample for node.js application #### 

$ docker run -d hello-world-nodjs
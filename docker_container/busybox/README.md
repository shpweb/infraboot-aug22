This is for showing example of busybox image with "sleep" command.
Also, for showing difference between ENTRYPOINT and CMD in dockerfile. 

The base image "busybox:latest" have CMD ["sh"] only in dockerfile. 

which is tweaked with ENTRYPOINT and CMD use in dockerfile as given. 

Use this image to run below set of individual command to see effect of ENTRYPOINT and CMD (after commenting and un-comment CMD line)

```
docker run -it mybusybox 10 
```
```
docker run -it mybusybox sleep 10
```
```
docker run -it mybusybox
```

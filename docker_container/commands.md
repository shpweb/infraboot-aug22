### bind the local volume to container with read only permission (for read write requirement remove the last flag :ro)

$ docker run -v /Users/shared/www:/usr/share/nginx/html:ro -d -p 8089:80 --name myweb2 nginx

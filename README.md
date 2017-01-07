#Nekogirls-rb
Nekogirls-rb is a pomf-like website built in Ruby and Sinatra,
 it lets users upload files from a webpage or (it is built for) using programs
 such as ShareX


#To Do
* Add Readme setup/usage
* Make custom 404 page
* Redirect to image after its uploaded
* Setup special code to make the website Personal
* Damn favicon

#Setup/Usage
The following files need to be created and uncommented out from `nekogirls.rb`
* views/index.haml
* views/404.haml
The config file is pretty self explanatory and has code comments to help

##ShareX Example
```
{
  "Name": "nekogirls.moe",
  "RequestType": "POST",
  "RequestURL": "http://nekogirls.moe/upload",
  "FileFormName": "file_to_upload",
  "Arguments": {
    "code": "SpecialCodeGoesHere"
  },
  "ResponseType": "Text"
}
```

##Using Nginx to serve files example
Probably not a great example since its assuming you are just using a root user on your server.

You'll need to change the locations, the proxy pass (since nginx will handle the website domain and port 80) and the names of the folders and files.

```
server {
        listen 80;
        server_name nekogirls.moe;
        root /root/nekogirls-rb/public;
        access_log /var/log/nginx/nekogirls-rb-access.log;
        error_log /var/log/nginx/nekogirls-rb-error.log;
        location /p/ {
                try_files $uri $uri/ =404;
        }
        location /css/ {
                try_files $uri $uri/ =404;
        }
        location / {
                proxy_pass http://localhost:8080;
        }
}```
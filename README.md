#Nekogirls-rb
Nekogirls-rb is a pomf-like website built in Ruby and Sinatra,
 it lets users upload files from a webpage or (it is built for) using programs
 such as ShareX


#To Do
* Add ReadMe info
* Make custom home/404 pages
* Redirect to image after its uploaded
* Setup special code to make the website Personal
* Damn favicon

#Setup/Usage
The following files need to be modified for your own theme/site
* views/index.haml
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
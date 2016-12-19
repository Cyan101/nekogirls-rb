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
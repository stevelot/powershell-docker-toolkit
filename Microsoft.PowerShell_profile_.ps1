# Curl alias using docker
# https://thepracticalsysadmin.com/curl-on-windows-using-a-docker-wrapper/

function Docker-Curl {
    docker run --rm byrnedo/alpine-curl $args
 }
 
# Aliases
#del alias:curl -Force
New-Alias durl Docker-Curl
echo "durl toegevoegd"

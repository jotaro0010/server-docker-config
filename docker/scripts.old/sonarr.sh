docker create \
    --name $USER-sonarr \
    --net  $USER-net \
    --restart="always" \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=America/Denver \
    -v /dev/rtc:/dev/rtc:ro \
    -v ~/docker/containers/sonarr:/config \
    -v ~/downloads/tv:/tv \
    -v ~/downloads:/downloads \
    linuxserver/sonarr

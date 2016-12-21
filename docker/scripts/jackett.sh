docker create \
    --name $USER-jackett \
    --net  $USER-net \
    --restart="always" \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=America/Denver \
    -v ~/docker/containers/jackett:/config \
    -v ~/downloads/torrents/watch:/downloads \
    linuxserver/jackett

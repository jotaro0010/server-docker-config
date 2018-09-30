docker create \
    --name $USER-headphones \
    --net  $USER-net \
    --restart="always" \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=America/Denver \
    -v ~/docker/containers/headphones:/config \
    -v ~/downloads/torrents:/downloads \
    linuxserver/headphones

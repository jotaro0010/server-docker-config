docker create \
    --name $USER-couchpotato \
    --net  $USER-net \
    --restart="always" \
    -v ~/docker/containers/couchpotato/config:/config \
    -v ~/downloads:/downloads \
    -v ~/downloads/movies:/movies \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=America/Denver \
    --log-opt max-size=1m \
    --log-opt max-file=1 \
    linuxserver/couchpotato

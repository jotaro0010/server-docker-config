# server-docker-config
This is the configuration I am using on my server. My goal was to practice docker stuff and set up a multi user seedbox. I made heavy use of docker and nginx.

## Docker Folder Structure
There is a docker folder in each users home folder. The system docker folder is stored under `/opt/docker`

This is the structure for the docker folder:
```
|-- docker/
|   |-- containers/
|   |   |-- nginx/
|   |   |-- muximux/
|   |-- scripts/
|   |   |-- nginx.sh
|   |   |-- muximux.sh
```

The `scripts/` folder holds the docker create scripts. Each script is basically just copied from the docker hub page for each app.

The `containers/` folder hold the config files for the containers.

## Nginx Dockers
### System nginx
First there is the `nginx-system` container which handles the ssl connectivity, htaccess configuration, and user routing. It is the only nginx container with ports open to the internet, port 80 and 443. It will detect which user just logged in and connect to the appropriate nginx server for that user.

### User nginx
Each user has there own nginx docker. for example for the user named jotaro there is a docker called jotaro-nginx.
This docker handles all the reverse proxy settings for any other docker apps jotaro is running.

### Routing users
For the system nginx docker there is a config file called `users.conf` inside the `opt/docker/containers/nginx/config/` folder. It holds a few if statements that check which user is logged in and it will reverse proxy them to the users nginx docker.

## References
I copied a lot of the configs for the reverse proxy settings from Thermionix post here. He also had the commands for the htpasswd stuff in the comments that I used to create the `htpasswd.sh` script.
https://gist.github.com/Thermionix/3375989

For a while I started setting things up using this guide from linuxserver.io:
https://www.linuxserver.io/2015/11/10/overview-reverse-proxy-with-docker/
I found that getting all the reverse proxy settings in apache working was not easy at all especially for muximux and glances. That's why I eventually switched to nginx. It was a great guide though and definetly helped me get started.

I used these guides to set up ssl and create the self signed certificates for nginx:
http://how2ssl.com/articles/openssl_commands_and_tips/
https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
I used www.ssllabs.com to test it and I got an A if trust issues are ignored.

To set up the OpenVPN I used this guide:
https://www.digitalocean.com/community/tutorials/how-to-run-openvpn-in-a-docker-container-on-ubuntu-14-04
I didn't follow it exactly as i didn't really want to set up a Docker volume container to hold the configuration data. I don't see the benefits for storing it that way rather than on the host.
In part 5 of that guide there is intructions to set up the client on a bunch of different OS's. That's pretty helpfull to look up.

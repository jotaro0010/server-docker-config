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

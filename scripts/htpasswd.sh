help='usage: htpasswd.sh [username]'

htpath="/opt/docker/containers/nginx/config"

if [[ -z $1 ]]; then
    echo $help
elif [[ $1 == "-h" ]]; then
        echo $help
else
    echo "Do you want to create an entry for $1?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) echo "Creating a cert for $1: "
                  echo -n "$1:" >> ${htpath}/htpasswd
                  echo "enter a password for user $1: "
                  openssl passwd -apr1 >> ${htpath}/htpasswd
                break;;
            No ) exit;;
        esac
    done
fi

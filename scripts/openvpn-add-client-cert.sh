
help='usage: openvpn-add-client-cert.sh [clientname]'

if [[ -z $1 ]]; then
    echo $help
elif [[ $1 == "-h" ]]; then
        echo $help
else
    echo "Do you want to create a client named $1?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) echo "Creating a cert for $1: "
                  docker run -v /opt/docker/containers/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $1 nopass
                  docker run -v /opt/docker/containers/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $1 > ${1}.ovpn
                break;;
            No ) exit;;
        esac
    done
fi

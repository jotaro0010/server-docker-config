help='changes userOne to [username] in all sub files usage: change-user.sh [username]'

if [[ -z userOne ]]; then
    echo $help
elif [[ userOne == "-h" ]]; then
        echo $help
else
    find ./ -type f -not -path '*.sh' \
                    -not -path '*/nginx/config/services/*' \
                    -not -path "*/nginx/config/conf.d"  \
                        -exec sed -i "s/userOne/$1/g" {} +
fi

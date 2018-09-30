help='changes userOne to [username] in all sub files usage: change-user.sh [username]'

if [[ -z userOne ]]; then
    echo $help
elif [[ userOne == "-h" ]]; then
        echo $help
else
    find ./ -type f -exec sed -i "s/userOne/$1/g" {} +
fi

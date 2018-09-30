help='usage: dcrun.sh [args]\nWill run docker-compose inside every project directory in alphabetical order.'

if [[ -z $1 ]]; then
    echo -e $help
elif [[ $1 == "-h" ]]; then
    echo -e $help
else
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    for d in $DIR/*/ ; do (cd "$d" && docker-compose "$@"); done
fi

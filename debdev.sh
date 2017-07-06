#!/bin/sh

env_file=$HOME/.config/docker-env/debiandev
# Prepare env_file like this
if false; then
    env_dir=$(dirname "$env_file")
    test -d "$env_dir" || mkdir -p "$env_dir"
    if ! test -f "$env_file"; then
        echo "DEBEMAIL=my@email" > "$env_file"
        echo "DEBFULLNAME=My Full Name" >> "$env_file"
        echo "TZ=My/Timezone" >> "$env_file"
    fi
fi

test -f changelog && v_path=$(dirname $PWD) || v_path=$PWD

docker run --rm -v "$v_path:/build/src" -v "$HOME/deb:/build" \
    -v "$HOME/.gnupg:/home/builder/.gnupg" \
    "$@" \
    --env-file "$env_file" \
    -ti yatheo/debiandev

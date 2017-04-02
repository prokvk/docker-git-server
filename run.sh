#! /bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
PWD=$(dirname "$SCRIPT")

exec /usr/bin/docker run --rm --name git_server -p 2044:22 -v $PWD/repos:/git-server/repos -v $PWD/keys:/git-server/keys git_server
#!/usr/bin/env bash

# show usage
[[ -z "$1" || -z "$2" || -z "$3" ]] && {
	echo "Usage: $(basename "$0") host port path" 1>&2
	exit 1
}

# open the socket
exec 3<> "/dev/tcp/$1/$2"

# send request
printf "GET $3 HTTP/1.1\r\n" >&3
printf "\r\n" >&3

# print response
cat <&3

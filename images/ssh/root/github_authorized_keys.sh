#!/bin/bash

[[ -z $1 ]] && exit 1

# this probably needs to be made safer
wget -qO - https://api.github.com/users/$1/keys | jq '.[].key' | sed 's/\"//g' | tee /etc/ssh/authorized_keys
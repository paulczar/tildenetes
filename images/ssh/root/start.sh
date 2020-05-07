#!/bin/bash

TILDE_USER=${TILDE_USER:-"web"}

echo "--> Creating user ${TILDE_USER}"
adduser --home /home/user --disabled-password --shell /bin/bash \
  --gecos "${TILDE_USER}" --uid 1000 --gid 101 "${TILDE_USER}"

if [[ ! -e /home/user/public_html/index.html ]]; then
  cp /etc/skel/public_html/index.html /home/user/public_html/index.html
fi

chown -R 1000:101 /home/user

echo "--> Starting ssh server"
exec /usr/sbin/sshd -D -e
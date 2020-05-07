FROM ubuntu:latest

RUN apt-get -q update && \
    apt-get -qy install openssh-server openssh-sftp-server curl jq

COPY root /root
COPY sshd_config /etc/ssh/sshd_config
COPY skel /etc/skel
COPY banner.txt /etc/banner.txt

RUN mkdir -p /run/sshd && \
    touch /etc/ssh/authorized_keys && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

CMD ["/root/start.sh"]
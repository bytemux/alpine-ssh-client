FROM alpine:3.8
RUN apk --update add --no-cache openssh bash curl \
&& rm -rf /var/cache/apk/* \
&& mkdir -p ~/.ssh \
&& echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
&& touch ~/.ssh/id_rsa \
&& chmod 700 ~/.ssh \
&& chmod 600 ~/.ssh/* \
&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ no/ /etc/ssh/sshd_config

RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
&& /usr/bin/ssh-keygen -A

CMD ["/usr/sbin/sshd","-D"]

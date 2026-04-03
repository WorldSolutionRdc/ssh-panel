FROM alpine:latest

RUN apk add --no-cache \
    openssh-server \
    openssh-client \
    bash \
    curl \
    socat \
    tini \
    && ssh-keygen -A \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/sshd /root/.ssh /home

RUN echo 'root:changeme' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config && \
    echo "Port 443" >> /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]

FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server websockify python3

RUN useradd -m -s /bin/bash WorldSolution && echo "WorldSolution:mondevpn" | chpasswd

RUN mkdir -p /var/run/sshd && echo "Port 22" >> /etc/ssh/sshd_config

EXPOSE 8080

CMD ["websockify", "8080", "localhost:22"]

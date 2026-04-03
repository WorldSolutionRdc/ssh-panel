#!/bin/bash
set -e

echo "=== Demarrage du serveur SSH sur port 443 ==="

if [ ! -z "$SSH_USER" ] && [ ! -z "$SSH_PASS" ]; then
    echo "Creation de l'utilisateur $SSH_USER"
    adduser -D -s /bin/bash "$SSH_USER"
    echo "$SSH_USER:$SSH_PASS" | chpasswd
    
    echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
    echo "GatewayPorts yes" >> /etc/ssh/sshd_config
    echo "PermitTunnel yes" >> /etc/ssh/sshd_config
    echo "ClientAliveInterval 30" >> /etc/ssh/sshd_config
    echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
fi

echo "SSH demarre sur le port 443"
exec /usr/sbin/sshd -D -p 443 -e

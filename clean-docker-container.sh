#!/bin/bash

# Verificar a utilização do dispositivo /dev/md2
usage=$(df -h /dev/md2 | awk 'NR==2 {print $5}' | tr -d '%')

# Verificar se a utilização é maior que 50%
if [ $usage -gt 50 ]; then
    # Parar o serviço Docker
    systemctl stop docker

    # Parar o socket do Docker
    systemctl stop docker.socket

    # Remover os containers do Docker
    rm -rf /var/lib/docker/containers/*

    # Iniciar o serviço Docker
    systemctl start docker

    # Iniciar o socket do Docker
    systemctl start docker.socket

    echo "Script executado. Utilização de /dev/md2 acima de 50%."
else
    echo "Script não executado. Utilização de /dev/md2 abaixo de 50%."
fi

<p align="center">
<img src="https://cwmkt.com.br/wp-content/uploads/2024/04/logo_github.png" width="240" />
<p align="center">Guia de Limpeza da Pasta Containers🚀</p>
</p>
  
<p align="center"> 
<a href="https://hubconnect.top" target="_blank">👉 Participe da Comunidade HubConnect 👈</a>
</p>

<hr />
<hr />

Crie um arquivo chamado docker_commands.sh

```bash
nano docker_commands.sh
```

No editor nano, insira os comandos necessários:

```bash
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
```

Torne o script executável:

```bash
chmod +x docker_commands.sh
```

Execute crontab -e para editar o arquivo Cron e adicione a seguinte linha no final para executar o script exatamente às 02:00 da manhã:

```bash
crontab -e
```

```bash
0 2 * * * /root/docker_commands.sh
```

**Pronto tudo Funcionando** ✅😎


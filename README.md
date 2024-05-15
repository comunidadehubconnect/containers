<p align="center">
<img src="https://cwmkt.com.br/wp-content/uploads/2024/04/logo_github.png" width="240" />
<p align="center">Guia de Limpeza da Pasta Containers🚀</p>
</p>
  
<p align="center">
<img src="https://whatsapp.com/favicon.ico" alt="WhatsAPP-logo" width="32" />
<span>Grupo WhatsaAPP: </span>
<a href="https://chat.whatsapp.com/K0HnkUZ41CYL8txpPWx2hO" target="_blank">Grupo</a>
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
0 2 * * * /caminho/para/o/script/docker_commands.sh
```

**Pronto tudo Funcionando** ✅😎


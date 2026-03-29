#!/bin/bash

# Script para garantir que os serviços estejam sempre rodando
# Pode ser executado múltiplas vezes sem problemas

echo "=== Iniciando serviços ==="

# Verificar se MariaDB está rodando
if ! sudo service mariadb status > /dev/null 2>&1; then
    echo "Iniciando MariaDB..."
    sudo service mariadb start
    sleep 2

    echo "MariaDB iniciado"
else
    echo "MariaDB já está rodando"
fi

# Verificar se PHP está rodando
if ! pgrep -f "php -S localhost:8080" > /dev/null; then
    echo "Iniciando servidor PHP..."
    cd /workspaces/php-mysql
    nohup /usr/bin/php -S localhost:8080 -t ./ > /tmp/php.log 2>&1 &
    sleep 1
    echo "Servidor PHP iniciado"
else
    echo "Servidor PHP já está rodando"
fi

echo "=== Serviços iniciados ==="
#!/bin/bash

# Script manual para iniciar serviços
# Execute este script se o postStartCommand não funcionar automaticamente
# Uso: bash .devcontainer/start-services.sh

echo "=== Iniciando serviços manualmente ==="

# Dar permissões de execução aos scripts
chmod +x /workspaces/PHP/.devcontainer/*.sh

# Executar script de inicialização
bash /workspaces/PHP/.devcontainer/startup.sh

echo "=== Serviços iniciados manualmente ==="
echo "Teste: curl http://localhost:8080/index.php"
#!/usr/bin/env bash

# Definir uma lista de opções para o usuário escolher e um array associativo para mapeá-las
options=("Home server (wired)" "Notebook (dandelion)")
declare -A hostnames

# Mapear cada opção para um nome personalizado
hostnames=(
    ["Home server (wired)"]="wired"
    ["Notebook (dandelion)"]="dandelion"
)

echo "Escolha o host:"
select choice in "${options[@]}"; do
    # Se uma opção válida for escolhida, 'choice' terá um valor não vazio
    if [ -n "$choice" ]; then
        HOST="${hostnames[$choice]}"
        echo "Você escolheu: $HOST"
        break
    else
        echo "Opção inválida. Por favor, escolha novamente."
    fi
done

# Mover o conteúdo de /etc/nixos para um diretório de backup
sudo mv /etc/nixos /etc/nixos_bkp

# Criar o novo diretório /etc/nixos
sudo mkdir -p /etc/nixos

# copia o conteúdo do diretório atual para /etc/nixos
sudo cp -r -v ./* /etc/nixos

# Definir dono do diretorio de configuração nix
sudo chown "$USER":users -R /etc/nixos

# Gerar o hardware-configuration.nix
sudo nixos-generate-config --force

# Remove trash
sudo rm -rf /etc/nixos/configuration.nix

# Executar home-manager e nixos-rebuild com o nome do host fornecido
sudo nixos-rebuild switch --flake /etc/nixos#"$HOST"  
ho mt-manager --flake /etc/nixos switch

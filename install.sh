#!/usr/bin/env bash

# Solicitar o nome do host ao usuário
read -p "Digite o nome do host: " HOSTNAME

# Verificar se a variável não está vazia
if [ -z "$HOSTNAME" ]; then
    echo "Nome do host não pode estar vazio. Saindo..."
    exit 1
fi

# Mover o conteúdo de /etc/nixos para um diretório de backup
sudo mkdir -p /etc/nixos_bkp
sudo mv /etc/nixos/* /etc/nixos_bkp/

# Criar o novo diretório /etc/nixos se não existir
sudo mkdir -p /etc/nixos

# Mover o conteúdo do diretório atual para /etc/nixos
sudo mv ./* /etc/nixos

# Gerar o hardware-configuration.nix
sudo rm -rf /etc/nixos/nixos/hardware-configuration.nix
sudo nixos-generate-config --dir /etc/nixos/nixos

# Executar home-manager e nixos-rebuild com o nome do host fornecido
home-manager --flake /etc/nixos switch --experimental-features 'nix-command flakes' &&
    sudo nixos-rebuild switch --flake /etc/nixos#$HOSTNAME

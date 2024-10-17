#!/usr/bin/env bash

# Solicitar o nome do host ao usuário
read -p "Digite o nome do host: " HOSTNAME

# Verificar se a variável não está vazia
if [ -z "$NEWHOSTNAME" ]; then
    echo "Nome do host não pode estar vazio. Saindo..."
    exit 1
fi

# Mover o conteúdo de /etc/nixos para um diretório de backup
sudo mv /etc/nixos /etc/nixos_bkp

# Criar o novo diretório /etc/nixos 
sudo mkdir -p /etc/nixos

# Mover o conteúdo do diretório atual para /etc/nixos
sudo mv ./* /etc/nixos

# Definir dono do diretorio de configuração nix
sudo chown "$USER":users -R /etc/nixos

# Gerar o hardware-configuration.nix
sudo nixos-generate-config --dir --force /etc/nixos/nixos

# Executar home-manager e nixos-rebuild com o nome do host fornecido
home-manager --flake /etc/nixos switch --experimental-features 'nix-command flakes' &&
    sudo nixos-rebuild switch --flake /etc/nixos#$NEWHOSTNAME

#!/usr/bin/env bash

# Definir uma lista de opções para o usuário escolher
options=("wired (home-server)" "dandelion (notebook)")

echo "Escolha o host:"
select HOST in "${options[@]}"; do
    # Se uma opção válida for escolhida, 'HOST' terá um valor não vazio
    if [ -n "$HOST" ]; then
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
sudo nixos-rebuild switch --flake /etc/nixos#"$HOST" && home-manager --flake /etc/nixos switch

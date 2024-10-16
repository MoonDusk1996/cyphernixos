{ config
, pkgs
, ...
}: {
  programs.zsh = {
    enable = true;
    initExtra = "source ~/.p10k.zsh";

    shellAliases = {
      # Misc
      ll = "ls -l";
      la = "ls -al";
      n = "nvim";
      r = "ranger";
      logs-bitcoind = "journalctl -u bitcoind -f";
      logs-electrs = "journalctl -u electrs -f";
      ns = "nix-shell";
      nostrudel = "cd ~/repo/nostr-clients/nostrudel/ && nix-shell";
      primal = "cd ~/repo/nostr-clients/primal-web-app/ && nix-shell";

      # NixOS
      update = "sudo nixos-rebuild switch";
      hm = "home-manager --flake /etc/nixos/ switch";
      clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && nix-store --delete";
      config = " cd /etc/nixos/ && nvim";
    };

    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma";
          repo = "fast-syntax-highlighting";
          rev = "v1.55";
          sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.4";
          sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
        };
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}

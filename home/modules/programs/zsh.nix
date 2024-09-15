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

      # NixOS
      update = "sudo nixos-rebuild switch";
      hm = "home-manager switch";
      update-all = "sudo nixos-rebuild switch && home-manager switch && sudo reboot";

      # Bitcoin Hub
      start-bitcoin-hub = "extra-container start bitcoinhub";
      stop-bitcoin-hub = "extra-container stop bitcoinhub";
      bitcoin-getinfo = "extra-container run bitcoinhub -- bitcoin-cli -getinfo";
      bitcoind-logs = "extra-container run bitcoinhub -- journalctl -u bitcoind -f";
      electrs-logs = "extra-container run bitcoinhub -- journalctl -u electrs -f";

      };

    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    plugins = [
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
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma";
          repo = "fast-syntax-highlighting";
          rev = "v1.55";
          sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
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

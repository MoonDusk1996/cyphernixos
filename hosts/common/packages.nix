{ pkgs, ... }: {
  programs = {
    zsh.enable = true;
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs; [
    udisks2
  ];
}

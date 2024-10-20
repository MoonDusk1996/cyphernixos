{ pkgs, ... }: {
  users = {
    users = {
      dusk = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      };
    };
  };
  # zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
}

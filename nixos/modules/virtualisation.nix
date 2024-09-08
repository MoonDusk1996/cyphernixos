{
  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "dusk" ];

  # Qemu
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # Nix Extra-Container
  programs.extra-container.enable = true;
}

{
  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "dusk" ];

  # Nix Extra-Container
  programs.extra-container.enable = true;
}

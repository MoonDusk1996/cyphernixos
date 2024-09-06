{
  description = "main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    # Bitcoin
    nix-bitcoin.url = "github:fort-nix/nix-bitcoin/release";
    extra-container.follows = "nix-bitcoin/extra-container";
  };

  outputs = { nixpkgs, nix-bitcoin, extra-container, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."dusk" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];

      };
      # Container configuration with nix-bitcoin
      mynode = extra-container.lib.buildContainers {
        inherit system;

        config = {
          containers.mynode = {
            # Always start container along with the container host
            autoStart = true;

            # This assigns the following addresses:
            # Host IP:      10.250.0.1
            # Container IP: 10.250.0.2
            extra.addressPrefix = "10.250.0";

            # Enable internet access for the container
            extra.enableWAN = true;

            # Map `/my/host/dir` to `/my/mount` in the container
            bindMounts."/mnt/" = {
              hostPath = "/mnt/";
              isReadOnly = false;
            };

            # Setup port forwarding
            # forwardPorts = [ { containerPort = 80; hostPort = 8080; protocol = "tcp";} ];

            config = { config, pkgs, ... }: {
              imports = [ nix-bitcoin.nixosModules.default ];

              # Automatically generate all secrets required by services.
              # The secrets are stored in /etc/nix-bitcoin-secrets in the container
              nix-bitcoin.generateSecrets = true;

              # Enable some services.
              # See ../configuration.nix for all available features.
              services.bitcoind = {
                enable = true;
                dataDir = "/mnt/ciberia/bitcoin-server/bitcoin-node";
              };
              services.electrs = {
                enable = true;
                dataDir = "/mnt/ciberia/bitcoin-server/electrs/";
              };
            };
          };
        };
      };
    };
}


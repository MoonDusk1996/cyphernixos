{
  outputs = { nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hm = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          sharedModules = [
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };
      };
    in
    {
      nixosConfigurations = {
        # Home server
        wired = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/common.nix
            ./hosts/home_server
            inputs.nix-bitcoin.nixosModules.default
            (inputs.nix-bitcoin + "/modules/presets/enable-tor.nix")
            inputs.home-manager.nixosModules.home-manager
            hm
          ];
        };
        # Notebook
        dandelion = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/common.nix
            ./hosts/notebook
            inputs.home-manager.nixosModules.home-manager
            hm
          ];
        };
      };

      homeConfigurations = {
        "dusk@wired" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./homes/dusk
            ./homes/dusk/wired
          ];
        };
        "dusk@dandelion" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./homes/dusk
            ./homes/dusk/dandelion
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-bitcoin.url = "github:fort-nix/nix-bitcoin/release";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
  };
}

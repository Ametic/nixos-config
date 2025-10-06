{
  description = "AmeOS";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    nixcord.url = "github:kaylorben/nixcord";

    # Hypersysinfo  (Optional)
    #hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";

    # QuickShell (optional add quickshell to outputs to enable)
    #quickshell = {
    #  url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-master,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    host = "desktop";
    profile = "amd";
      username = "jakub";

      pkgs-master = import nixpkgs-master {
        inherit system;
        config.allowUnfree = true;
      };

      # Deduplicate nixosConfigurations while preserving the top-level 'profile'
      mkNixosConfig = gpuProfile: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile; # keep using the let-bound profile for modules/scripts
          nixpkgs-master = pkgs-master;
        };
        modules = [
          ./profiles/${gpuProfile}
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    in
    {
      nixosConfigurations = {
        amd = mkNixosConfig "amd";
        nvidia = mkNixosConfig "nvidia";
        nvidia-laptop = mkNixosConfig "nvidia-laptop";
        intel = mkNixosConfig "intel";
        vm = mkNixosConfig "vm";
      };
    };
}

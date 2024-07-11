{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let inherit (self) outputs; in {
    nixosConfigurations = {
      #TODO: change B550 to your hostname
      B550 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          #TODO: change B550 to your hostname
          ./system/host-specific/B550
        ];
      };
      #TODO: change T430s to your hostname
      T430s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          #TODO: change T430s to your hostname
          ./system/host-specific/T430s
        ];
      };
    };
  };
}

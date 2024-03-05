{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let inherit (self) outputs; in {
    nixosConfigurations = {
      B550 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/B550
          ./hosts/common
        ];
      };
      T430s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/T430s
          ./hosts/common
        ];
      };
    };
  };
}

#
# This file is intended for non-host-specific settings.
#

{ pkgs }:
let
  stylix = pkgs.fetchFromGitHub {
      owner = "danth";
      repo = "stylix";
      rev = "...";
      sha256 = "...";
  };
in {
    imports = [ (import stylix).homeManagerModules.stylix ];

    stylix = {
      enable = true;
      image = ./wallpaper.jpg;
    };
}

# { pkgs }:
# let
#   stylix = pkgs.fetchFromGitHub {
#       owner = "danth";
#       repo = "stylix";
#       rev = "1ff9d37d27377bfe8994c24a8d6c6c1734ffa116";
#       sha256 = "1ff9d37d27377bfe8994c24a8d6c6c1734ffa116";
#   };
# in
# {
#   imports = [ (import stylix).nixosModules.stylix ];

#   stylix = {
#     enable = true;
#     # image = ./wallpaper.jpg;
#   };
# }

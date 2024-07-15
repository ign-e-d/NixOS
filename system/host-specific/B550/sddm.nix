#
# This file is intended for host-specific settings.
#

{ pkgs }:
let
  configRepo = pkgs.fetchFromGitHub {
    owner = "ign-e-d";
    repo = "NixOS";
    rev = "2414286217c0f8822c3f5f70366a98d479ebdcae";
    sha256 = "11yi4bqnrhdvbjm0yzpnrr7jn84n2aj7nzm9d8bhwzs55ps6ppwa"; # use nix-shell -p nix-prefetch-git https://github.com/ign-e-d/NixOS
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-catppuccin";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "1a58b5c2d898a70c22e4d9462039111f5613a7c0";
    sha256 = "0pm27f74hdzgmmg14dy4g94kk8v0hp8nvzr7g0v22nnx6m08v6vi";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./src/catppuccin-latte/* $out/
    cp -r ${configRepo}/pictures/wallpaper2.jpg $out/backgrounds/wall.jpg
    cd $out/
    rm theme.conf
    cp -r ${configRepo}/misc/theme.conf $out/
   '';
}

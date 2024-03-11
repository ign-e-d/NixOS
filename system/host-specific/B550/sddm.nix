#
# This file is intended for host-specific settings.
#

{ pkgs }:
let
  configRepo = pkgs.fetchFromGitHub {
    owner = "ign-e-d";
    repo = "NixOS";
    rev = "5fa8918fdfedb3cde6313c823d0f4e13060b02f7";
    sha256 = "0ll0dczhl3gfdy3fni0vw7k60ak12lagm72jhwxb0k2jpmn24p63";
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
    cp -r ${configRepo}/pictures/wallpaper.jpg $out/backgrounds/wall.jpg
    cd $out/
    rm theme.conf
    cp -r ${configRepo}/misc/theme.conf $out/
   '';
}


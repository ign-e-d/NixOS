#
# This file is intended for host-specific settings.
#

{ pkgs ? import <nixpkgs> {} }:
let
  configRepo = pkgs.fetchFromGitHub {
    owner = "ign-e-d";
    repo = "NixOS";
    rev = "ef61c9d2630adfd6a0897cf9568381fdd23faaba";
    sha256 = "1jj05nzfas0y0vi0a7iw5ksmak943x0xkd1nz7014xp3v0yl1dj6";
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
    rm $out/theme.conf
    cp -r ${configRepo}/misc/theme.conf $out/
   '';

#    echo -e "[Theme]\nCurrent=catppuccin-latte" > $out/sddm.conf
}


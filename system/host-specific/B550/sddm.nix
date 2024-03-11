#
# This file is intended for host-specific settings.
#

{ pkgs }:
let
  configRepo = pkgs.fetchFromGitHub {
    owner = "ign-e-d";
    repo = "NixOS";
    rev = "c9bca767bbf1ecbe91d4c1f790ec8f29134c3b28";
    sha256 = "0icbq0znhn12xp16yp65hhq1annb9r33q995iqn0xl9ycblwhgdw";
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


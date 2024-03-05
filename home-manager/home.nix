{ config, pkgs, inputs, ... }:
{
  home.username = "a";
  #home.homeDirectory = "/home/a/";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}

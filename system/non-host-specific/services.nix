#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  services.printing.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.flatpak.enable = true;

  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.theme = "${import ./sddm.nix { inherit pkgs; }}";

  services.displayManager.ly.enable = true;

  # services.picom = {
  #   enable = true;
  #   vSync = true;
  #   # settings = {
  #   #   unredir-if-possible = false;
  #   # };
  #   # shadowExclude = [
  #   #   "window_type *= 'menu'"
  #   #   "name ~= 'Firefox$'"
  #   #   "focused = 1"
  #   # ];
  #   backend = "xrender";
  #   # package = pkgs.picom-pijulius;
  # };

  services.ratbagd.enable = true; # for piper
}

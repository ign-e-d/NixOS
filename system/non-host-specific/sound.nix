#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  # sound.enable = true;

  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  services.pipewire = {
    enable = false;
  };

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
}

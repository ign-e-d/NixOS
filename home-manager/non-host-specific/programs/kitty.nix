#
# This file is intended for non-host-specific home-manager settings.
#

{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark";
    font = {
      name = "DroidSansMNerdFontMono";
      size = 12;
    };
    settings = {
      confirm_os_window_close = 0;
    };
  };
}

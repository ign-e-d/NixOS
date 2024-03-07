#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  i18n.extraLocaleSettings = {
    LC_ALL = "en_GB.UTF-8";
  };
}


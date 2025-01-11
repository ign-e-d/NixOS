#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  i18n.supportedLocales = [
    "all"
  ];

  i18n.defaultLocale = "en_GB.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ALL = "en_GB.UTF-8";
  # };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    LC_MESSAGES = "en_GB.UTF-8";
  };
}

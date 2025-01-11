#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  i18n.supportedLocales = [
    "en_GB.UTF-8/UTF-8"
  ];

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    # LC_CTYPE = "C";
    # LC_MESSAGES = "C";
    # LC_COLLATE = "C";
    LC_ALL = "en_GB.UTF-8";
  };

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "ru_RU.UTF-8";
  #   LC_IDENTIFICATION = "ru_RU.UTF-8";
  #   LC_MEASUREMENT = "ru_RU.UTF-8";
  #   LC_MONETARY = "ru_RU.UTF-8";
  #   LC_NAME = "ru_RU.UTF-8";
  #   LC_NUMERIC = "ru_RU.UTF-8";
  #   LC_PAPER = "ru_RU.UTF-8";
  #   LC_TELEPHONE = "ru_RU.UTF-8";
  #   LC_TIME = "ru_RU.UTF-8";
  # };
}

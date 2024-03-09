#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  home.username = "a";
  home.homeDirectory = "/home/a";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    nix-output-monitor

    anki-bin
    audacious
    clinfo
    drawio
    ffmpeg_5-full
    firefox
    gimp
    gsmartcontrol
    htop
    kiwix
    linuxKernel.packages.linux_5_4.wireguard
    lm_sensors
    mpv
    neofetch
    obs-studio
    obsidian
    octaveFull
    polkit
    qalculate-gtk
    qbittorrent
    runelite
    systemd
    tor-browser-bundle-bin
    unison
    vlc
    wireguard-tools
    wmctrl
    xclip
    xdotool
    xlogo

    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU

    steam
    steam-tui
    steamcmd
    steam-run

    kdePackages.yakuake
    kdePackages.ark
    kdePackages.kdeconnect-kde
    kdePackages.kdialog
    kdePackages.kate
    krita
  ];
}

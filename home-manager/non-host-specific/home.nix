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
    bat
    bottom
    clinfo
    corefonts #for latex
    drawio
    discord
    eza
    ffmpeg_5-full
    firefox
    gimp
    gsmartcontrol
    htop
    kiwix
    linuxKernel.packages.linux_5_4.wireguard
    libresprite
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
    sqlitebrowser
    tor-browser-bundle-bin
    texstudio
    texliveFull
    unison
    vlc
    vistafonts #for latex
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

    libsForQt5.yakuake
    libsForQt5.ark
    libsForQt5.kdeconnect-kde
    libsForQt5.kdialog
    libsForQt5.kate
    libsForQt5.filelight
    krita
  ];
}

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
  home.username = "a";
  home.homeDirectory = "/home/a";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    audacious
    alsa-utils

    bat
    bashmount
    broot
    bottom

    clinfo
    corefonts # for latex
    chromium
    cmus

    drawio
    discord

    eza

    ffmpeg_7-full
    firefox
    fselect

    gamescope

    htop
    hsetroot

    kiwix

    linuxKernel.packages.linux_5_4.wireguard
    lm_sensors

    # mpv
    maim

    neofetch
    nix-output-monitor

    obs-studio

    pavucontrol
    polkit

    qalculate-gtk
    qbittorrent

    runelite

    systemd
    sqlitebrowser

    tor-browser-bundle-bin
    telegram-desktop
    texstudio
    texliveFull
    twitch-tui

    v2raya
    vlc
    vistafonts # for latex
    vesktop

    walk
    wireguard-tools
    wmctrl

    xclip
    xdotool

    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU

    steam
    steam-tui
    steamcmd
    steam-run

    libsForQt5.ark
    # libsForQt5.kdeconnect-kde
    libsForQt5.kdialog
    # libsForQt5.kate
    libsForQt5.filelight
    # libsForQt5.kruler
    krita

    piper
  ];
}

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

    libsForQt5.yakuake
    libsForQt5.ark
    libsForQt5.kruler
    libsForQt5.kdeconnect-kde
    libsForQt5.kdenlive
    libsForQt5.kdialog
    kate
    krita
  ];
}

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
    blender
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

  programs.git = {
    enable = true;
    userName = "Ignatov Egor";
    userEmail = "ign-e-d@proton.me";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
      jdinhlife.gruvbox
      jnoortheen.nix-ide
    ];
  };

  programs.helix = {
    enable = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    settings = {
      theme = "gruvbox"; #material_darker
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        whitespace = {
          render = {
            space = "all";
            tab = "all";
            newline = "none";
          };
          characters = {
            tab = "→";
          };
        };
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
      };
      keys.normal = {
        ins = "insert_mode";
      };
      keys.insert = {
        S-tab = "unindent";
      };
    };
  };
}

{ config, pkgs, ... }:
{
  imports =
    [
      #<home-manager/nixos>
    ];

#  home-manager.users.a = {
#    home.stateVersion = "23.11";

#    nixpkgs.config = {
#      allowUnfree = true;
#      allowUnfreePredicate = _: true;
#    };

#    home.packages = with pkgs; [
#      anki-bin
#      audacious
#      blender
#      clinfo
#      drawio
#      ffmpeg_5-full
#      firefox
#      gimp
#      gsmartcontrol
#      htop
#      kiwix
#      linuxKernel.packages.linux_5_4.wireguard
#      lm_sensors
#      mpv
#      neofetch
#      obs-studio
#      obsidian
#      octaveFull
#      polkit
#      qalculate-gtk
#      qbittorrent
#      runelite
#      systemd
#      tor-browser-bundle-bin
#      unison
#      vlc
#      wireguard-tools
#      wmctrl
#      xclip
#      xdotool
#      xlogo

#      libreoffice-qt
#      hunspell
#      hunspellDicts.en_US
#      hunspellDicts.ru_RU

#      steam
#      steam-tui
#      steamcmd
#      steam-run

#      libsForQt5.yakuake
#      libsForQt5.ark
#      libsForQt5.kruler
#      libsForQt5.kdeconnect-kde
#      libsForQt5.kdenlive
#      libsForQt5.kdialog
#      kate
#      krita
#    ];

#    programs.git = {
#      enable = true;
#      userName = "Ignatov Egor";
#      userEmail = "ign-e-d@proton.me";
#    };

#    programs.vscode = {
#      enable = true;
#      extensions = with pkgs.vscode-extensions; [
#        llvm-vs-code-extensions.vscode-clangd
#        jdinhlife.gruvbox
#        jnoortheen.nix-ide
#      ];
#    };

#    programs.helix = {
#      enable = false;
#      settings = {
        #theme = "autumn_night";
#        editor.cursor-shape = {
#          normal = "block";
#          insert = "bar";
#          select = "underline";
#        };
#      };

#      languages = [
#        {
#          name = "nix";
#          auto-format = false;
#        }
#        {
#          name = "cpp";
#          auto-format = false;

          #language-servers = [
          #{
          #  name = "clangd";
          #}
          #];
#        }
#      ];
      # for grammars use hx --grammar fetch
      #language-server = {
      #  clangd = {
      #    command = "${pkgs.clang-tools}/bin/clangd";
      #  };
      #};
#    };
#  };
}

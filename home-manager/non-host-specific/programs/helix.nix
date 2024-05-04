#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    settings = {
      theme = "gruvbox";
      editor = {
        bufferline = "always";
        cursorline = true;
        mouse = true;
        soft-wrap = {
          enable = true;
        };
        file-picker = {
          hidden = false;
        };
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
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [
            "file-name"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "│";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
      keys.normal = {
        ins = "insert_mode";
      };
      keys.insert = {
        S-tab = "unindent";
      };
    };
    languages = {
      language = [{
        name = "cpp";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "c";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "nix";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "python";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }];
    };
  };
}

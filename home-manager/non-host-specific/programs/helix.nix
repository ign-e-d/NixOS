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
        bufferline = {
          always = true;
        };
        cursorline = {
          enable = true;
        };
        mouse = {
          enable = true;
        };
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

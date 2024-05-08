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

        C-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        C-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        C-h = [ "move_prev_word_start" "move_char_left" "move_char_right" ];
        C-l = [ "move_next_word_start" "move_char_left" "move_char_right" ];

        esc = [ "normal_mode" ":format" ":write-all" ];
      };
      keys.insert = {
        S-tab = "unindent";

        A-j = "move_line_down";
        A-k = "move_line_up";
        A-h = "move_char_left";
        A-l = "move_char_right";
        A-o = "open_below";
        A-p = "open_above";

        C-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        C-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        C-h = [ "move_prev_word_start" "move_char_left" "move_char_right" ];
        C-l = [ "move_next_word_start" "move_char_right" ];
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
        # TODO look at this https://github.com/helix-editor/helix/discussions/8567
        name = "python";
        formatter = {
          command = "black";
          args = [ "-" "--quiet" ];
        };
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "latex";
        formatter = {
          command = "prettier";
          args = [ "--parser" "latex-parser" ];
        };
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }];
    };
  };
}

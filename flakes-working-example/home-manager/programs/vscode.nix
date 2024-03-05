{ config, pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
      jdinhlife.gruvbox
      jnoortheen.nix-ide
    ];
  };
}

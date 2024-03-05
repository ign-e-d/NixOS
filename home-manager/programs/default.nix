{ config, pkgs, inputs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./vscode.nix
    ./programs.nix
  ];
}

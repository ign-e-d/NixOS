{ config, pkgs, inputs, ... }:
{
  imports = [
    ./helix.nix
    ./git.nix
    ./vscode.nix
    ./kitty.nix
  ];
}

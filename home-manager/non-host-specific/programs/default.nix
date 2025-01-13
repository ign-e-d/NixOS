{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./helix.nix
    ./git.nix
    ./kitty.nix
    ./stylix.nix
    ./bash.nix
  ];
}

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
    ./bash.nix
    ./ranger.nix
  ];
}

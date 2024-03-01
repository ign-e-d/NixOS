# NixOS configuration and helpful bash-scripts

The purpose of this repository is to make it easier to use a same NixOS configuration on multiple PCs at the same time. This repository allows you to easily manage the configurations of two PCs: desktop and notebook.

## NixOS configuration

Configuration nix-files are divided into 3 folders:

1. **Common-modules** - settings used on all PCs;
2. **Desktop-modules** - settings used on desktop PC;
3. **Notebook-modules** - settings used on notebook.

## Helpful bash-scripts

1. **check-updates.sh** - runs automatically by user systemd service "NixOS-check-updates" after user login. Compares local and remote git repositories for differences. In case of differences suggests to download new configuration from remote repository;
2. **rebuild.sh** - executes commands "sudo nixos-rebuild switch", "systemctl --user reenable NixOS-check-updates.service" and "systemctl --user restart NixOS-check-updates.service";
3. **rebuild-wrap.sh** - wrap around rebuild.sh to execute script in separate konsole to monitor the rebuilding process.

## Example of desktop PC /etc/nixos/configuration.nix

```
{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      /home/a/NixOS/Desktop-modules/imports.nix
    ];
}
```

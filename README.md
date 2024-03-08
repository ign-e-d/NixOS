# NixOS configuration with flakes and some useful bash scripts

This repository contains NixOS configuration with flakes for 2 hosts: desktop (B550) and notebook (T430s). Additionally, there are some useful bash scripts for configuration management.

## Explanation of the configuration structure

```
.
├── home-manager/          - home-manager configurations
│   ├── host-specific/     - home-manager configurations for specific hosts
│   │   ├── B550/
│   │   └── T430s/
│   └── non-host-specific/ - home-manager configuration for all hosts
│       └── programs/
├── scripts/               - useful bash-scripts
├── system/                - system-wide configurations
│   ├── host-specific/     - system-wide configurations for specific hosts
│   │   ├── B550/
│   │   └── T430s/
│   └── non-host-specific/ - system-wide configuration for all hosts
├── .directory
├── README.md
├── flake.lock
└── flake.nix
```

## Useful bash scripts

Purpose of scripts:

1. Easily keep local NixOS configuration up to date with a remote git repository;
  - [`check-updates.sh`](scripts/check-updates.sh):
    - Checks differences between local and remote repositories;
    - Suggests pulling a remote repository in case of differences;
  - [`looper.sh`](scripts/looper.sh):
    - Tries to execute the [`check-updates.sh`](scripts/check-updates.sh) script in a loop (used in the [`NixOS-check-updates`](system/non-host-specific/systemd.nix) systemd service);

2. Easily rebuild NixOS configuration and commit changes to a remote repository on a successful rebuild.
- [`nixos-rebuild.sh`](scripts/nixos-rebuild.sh):
  - Generates hardware-configuration.nix for the current host;
  - Rebuilds configuration;
  - Re-enables [`NixOS-check-updates`](system/non-host-specific/systemd.nix) systemd service;
  - Restarts [`NixOS-check-updates`](system/non-host-specific/systemd.nix) systemd service;
  - Commits and pushes changes to a remote repository with consent.
 - [`error-wrap.sh`](scripts/error-wrap.sh):
   - Executes the [`nixos-rebuild.sh`](scripts/nixos-rebuild.sh) script and handles errors;
 - [`konsole-wrap.sh`](scripts/konsole-wrap.sh):
   - Executes the [`error-wrap.sh`](scripts/error-wrap.sh) script in a separate konsole window;

## How can I make this useful for me?

### 1. Clone this repository
Create a configuration folder in a suitable location and copy repository content to this folder. I personally store NixOS configuration in the `~/NixOS` folder.

### 2. Enable flakes in your configuration
Add `nix.settings.experimental-features = [ "nix-command" "flakes" ]` to your current configuration. If you have some troubles, I suggest reading the [Flakes page on the wiki](https://nixos.wiki/wiki/Flakes).

### 3. Create host-folders
Create host-folders similar to existing ones at `home-manager/host-specific/` and `system/host-specific/`, where the folder name is your hostname.

> [!IMPORTANT]
> Don't forget to edit the content of .nix files. In some files, you should change paths to the right host-folders. For example, [`configuration.nix`](system/host-specific/B550/configuration.nix)

### 4. Rewrite [`flake.nix`](flake.nix) to match your configuration
Take a look at the #TODO comments. If you use other hosts, feel free to remove or add configurations to `nixosConfiguration`.

### 5. Here you go
Now you can rebuild your system manually by executing `sudo nixos-rebuild --verbose switch --flake .#$HOSTNAME` in the configuration folder. I advise you to create your own git repository in the configuration folder and use scripts from the `scripts/` folder.

### 6. Scripts usage
If you want to rebuild your system, you can use the [`nixos-rebuild.sh`](scripts/nixos-rebuild.sh) script. Keep in mind, that this script will exit on any error, so I advise using [`error-wrap.sh`](scripts/error-wrap.sh) for system rebuilding. Also, in my opinion, a very convenient way to execute the [`nixos-rebuild.sh`](scripts/nixos-rebuild.sh) script is via a desktop link to the application, that executes [`konsole-wrap.sh`](scripts/konsole-wrap.sh). In that case, it opens a separate konsole window, where it executes [`error-wrap.sh`](scripts/error-wrap.sh).

To check the relevance of the local git repository, the [`check-updates.sh`](scripts/check-updates.sh) script was written. Script [`looper.sh`](scripts/looper.sh) is desired only for [`NixOS-check-updates`](system/non-host-specific/systemd.nix) systemd service.

> [!IMPORTANT]
> If you don't want to use the [`check-updates.sh`](scripts/check-updates.sh) script, remove the [`NixOS-check-updates`](system/non-host-specific/systemd.nix) systemd service from the configuration.

## Useful links

This repository was heavily inspired by the links listed below. I highly recommend checking them out.

1. [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
2. [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs)
3. [configuration.nix by 0atman](https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5)
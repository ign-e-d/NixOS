#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
    users.extraGroups.vboxusers.members = [ "a" ];
}

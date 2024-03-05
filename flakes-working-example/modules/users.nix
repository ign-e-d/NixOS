{ config, pkgs, ... }:
{
  users.users.a = {
    isNormalUser = true;
    description = "a";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      glibcLocalesUtf8
    ];
  };
}

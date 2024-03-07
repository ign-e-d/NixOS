{ config, pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Ignatov Egor";
    userEmail = "ign-e-d@proton.me";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}

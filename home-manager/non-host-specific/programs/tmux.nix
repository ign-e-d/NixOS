{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.tmux-which-key
    ];
  };
}

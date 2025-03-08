{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.tmux-which-key;
        extraConfig = "set -g @plugin 'alexwforsythe/tmux-which-key'";
      }
    ];
  };
}

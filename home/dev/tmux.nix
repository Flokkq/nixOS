{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;

    shortcut = "C-d";
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.cpu
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
      tmuxPlugins.copycat

      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
  };
}

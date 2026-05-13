{
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  stylix.targets.tmux.enable = true;

  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    newSession = true;
    secureSocket = true;
    shortcut = "C-q";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      better-mouse-mode
      sensible
      copycat
      yank
      cpu

      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'sessio'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];

    extraConfig = ''
      # set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"
      set -as terminal-features ",xterm-256color:RGB"
      # set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # set vi-mode
      set-window-option -g mode-keys vi

      # Old tmux bar layout, recolored with Stylix.
      set -g status on
      set -g status-bg "${colors.base00}"
      set -g status-justify left
      set -g status-left-length 100
      set -g status-right-length 100
      set -g status-style "fg=${colors.base05},bg=${colors.base00}"
      set -g message-style "fg=${colors.base0C},bg=${colors.base01},align=centre"
      set -g message-command-style "fg=${colors.base0C},bg=${colors.base01},align=centre"
      set -g pane-border-style "fg=${colors.base01}"
      set -g pane-active-border-style "fg=${colors.base0D}"
      setw -g window-status-activity-style "fg=${colors.base05},bg=${colors.base00},none"
      setw -g window-status-separator ""
      setw -g window-status-style "fg=${colors.base05},bg=${colors.base00},none"
      set -g status-left ""
      set -g status-right "#[fg=${colors.base0E},bg=${colors.base00},nobold,nounderscore,noitalics]#[fg=${colors.base00},bg=${colors.base0E},nobold,nounderscore,noitalics] #[fg=${colors.base05},bg=${colors.base01}] #W #{?client_prefix,#[fg=${colors.base08}],#[fg=${colors.base0B}]}#[bg=${colors.base01}]#{?client_prefix,#[bg=${colors.base08}],#[bg=${colors.base0B}]}#[fg=${colors.base00}] #[fg=${colors.base05},bg=${colors.base01}] #S "
      setw -g window-status-format "#[fg=${colors.base00},bg=${colors.base0D}] #I #[fg=${colors.base05},bg=${colors.base01}] #W "
      setw -g window-status-current-format "#[fg=${colors.base00},bg=${colors.base09}] #I #[fg=${colors.base05},bg=${colors.base01}] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
      setw -g clock-mode-colour "${colors.base0D}"
      setw -g mode-style "fg=${colors.base0E},bg=${colors.base03},bold"

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -r a run-shell "tmux new-window 'nohup zathura $(find ~ -type f -name "*.pdf" | fzf)'"
      bind -r e display-popup -E -w 100% -h 100% "sh -lc 'tmux list-sessions -F \"#{session_name}\" \
        | fzf --reverse --exit-0 --select-1 \
        | xargs -r tmux switch-client -t'"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}

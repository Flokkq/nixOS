{pkgs, ...}: let
  catppuccin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "unstable-2023-01-06";
    src = pkgs.fetchFromGitHub {
      owner = "dreamsofcode-io";
      repo = "catppuccin-tmux";
      rev = "main";
      sha256 = "sha256-FJHM6LJkiAwxaLd5pnAoF3a7AE1ZqHWoCpUJE0ncCA8=";
    };
  };
  tmuxPomodoroPlus = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-pomodoro-plus";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "olimorris";
      repo = "tmux-pomodoro-plus";
      rev = "main";
      sha256 = "sha256-LjhG2+DOAtLwBspOzoI2UDTgbUFWj7vvj6TQXqWw9z0=";
    };
  };
in {
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    newSession = true;
    secureSocket = true;
    shortcut = "C-w";

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      tmuxPomodoroPlus

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
      # catppuccin
      set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, latte

      # tmux-pomodoro-plus
      set -g status-left "#{pomodoro_status}"
      set -g @pomodoro_granularity 'on'
      set -g status-interval 1

      set -g @pomodoro_toggle 'g'                    # Start/pause a Pomodoro/break
      set -g @pomodoro_cancel 'G'                    # Cancel the current session
      set -g @pomodoro_skip '_'                      # Skip a Pomodoro/break

      set -g @pomodoro_mins 50                       # The duration of the Pomodoro
      set -g @pomodoro_break_mins 5                  # The duration of the break after the Pomodoro completes
      set -g @pomodoro_intervals 4                   # The number of intervals before a longer break is started
      set -g @pomodoro_long_break_mins 25            # The duration of the long break
      set -g @pomodoro_repeat 'off'                  # Automatically repeat the Pomodoros?
      set -g @pomodoro_disable_breaks 'off'          # Turn off breaks

      set -g @pomodoro_on "  "                      # The formatted output when the Pomodoro is running
      set -g @pomodoro_complete " ✔︎"                 # The formatted output when the break is running
      set -g @pomodoro_pause " ⏸︎"                    # The formatted output when the Pomodoro/break is paused
      set -g @pomodoro_prompt_break " ⏲︎ break?"      # The formatted output when waiting to start a break
      set -g @pomodoro_prompt_pomodoro " ⏱︎ start?"   # The formatted output when waiting to start a Pomodoro

      set -g @pomodoro_menu_position "R"             # The location of the menu relative to the screen
      set -g @pomodoro_sound 'off'                   # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
      set -g @pomodoro_notifications 'off'           # Enable desktop notifications from your terminal
      set -g @pomodoro_granularity 'off'             # Enables MM:SS (ex: 00:10) format instead of the default (ex: 1m)

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

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -r a run-shell "tmux new-window 'nohup zathura $(fzf)'"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}

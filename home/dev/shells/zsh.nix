{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "colored-man-pages"
      ];
      # theme = "norm"; # Set your preferred theme
    };

    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      cls = "clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "~" = "cd ~";
      "/" = "cd /";

      lsn = "eza";
      ls = "eza -lah";
      ll = "eza -lh";
      la = "eza -A";
      tree = "eza --tree";

      e = "nvim .";
      cat = "bat";
      lg = "lazygit";

      git = "LC_ALL=en_US git";
      gs = "git status";
      ga = "git add";
      grm = "git rm";
      grmrf = "git rm -rf";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      gb = "git blame --color-lines";
      gd = "git diff";
      gcl = "git clone";

      speedtest = "curl -o /dev/null cachefly.cachefly.net/250mb.test";
    };

    # Custom initialization
    initExtra = ''
      export MANPAGER='nvim +Man!'
      export XDG_CONFIG_HOME="$HOME/.config"
      DISABLE_UNTRACKED_FILES_DIRTY="true"
      HISTSIZE=999999999
      SAVEHIST=999999999

      setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
      eval "$(starship init zsh)"
    '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "F-Sy-H";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "F-Sy-H";
          rev = "v1.67";
          sha256 = "zhaXjrNL0amxexbZm4Kr5Y/feq1+2zW0O6eo9iZhmi0=";
        };
      }
    ];
  };
}

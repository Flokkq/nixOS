{...}: {
  programs.obsidian = {
    enable = true;

    defaultSettings = {
      communityPlugins = ["Vimrc Support" "Git"];
      themes = ["Catppuccin"];
    };
  };
}

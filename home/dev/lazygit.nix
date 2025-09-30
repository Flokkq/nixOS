{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        commit.signOff = true;
        overrideGpg = true;
      };
    };
  };
}

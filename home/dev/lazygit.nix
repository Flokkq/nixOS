_: {
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        commit.signOff = true;
        overrideGpg = true;
      };
    };
  };

  # lazygit changed the location of its config file.
  # Until NixOS supports the new location, we hardlink it here.
  home.file.".config/lazygit/config.yml".text = ''
    git:
      commit:
        signOff: true
      overrideGpg: true
  '';
}

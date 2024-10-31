{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zellij
  ];

  # home.file.".config/zellij/config.kdl".source = ./config.kdl;

  programs.zellij = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      theme = "catppuccin-mocha";
      copy_command = "xclip -selection clipboard";
      disable_help = true;
      default_layout = "compact";
    };
  };
}

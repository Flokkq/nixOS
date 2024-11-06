{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Flokkq";
    userEmail = "webcla21@htl-kaindorf.at";
    signing.key = "0xC8A75B77C0DB31B9";
    signing.signByDefault = true;
    ignores = ["*~" ".DS_Store" ".direnv"];
    extraConfig = {
      core = {
        editor = "nvim";
      };
      commit = {
        template = "${pkgs.writeText "dco-signoff-template" ''


          Signed-off-by: ${config.programs.git.userName} <${config.programs.git.userEmail}>
        ''}";
      };
      pull = {
        rebase = true;
      };
      credential.helper = "!gh auth git-credential";
    };
  };
}

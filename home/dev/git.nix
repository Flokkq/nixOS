{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Flokkq";
        email = "webcla21@htl-kaindorf.at";
      };

      signing.signByDefault = true;
    };

    ignores = ["*~" ".DS_Store" ".direnv"];
    extraConfig = {
      init.defaultBranch = "main";

      core = {
        editor = "nvim";
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      push.autoSetupRemote = true;
      pull.rebase = true;

      rebase = {
        autoStash = true;
        misingCommitsCheck = "warn";
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
      };

      url = {
        "https://github.com/flokkq/".insteadOf = "f:";
        "https://github.com/".insteadOf = "gh:";
        "git@gitlab.com:".insteadOf = "gl:";
      };

      commit = {
        template = "${pkgs.writeText "dco-signoff-template" ''


          Signed-off-by: ${config.programs.git.settings.user.name} <${config.programs.git.settings.user.email}>
        ''}";
      };

      credential.helper = "!gh auth git-credential";
    };
  };
}

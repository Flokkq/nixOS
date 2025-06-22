{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Flokkq";
    userEmail = "webcla21@htl-kaindorf.at";

    signing = {
      signByDefault = true;
      key = config.sops.secrets."git/signing/signature".path;
    };

    ignores = ["*~" ".DS_Store" ".direnv"];

    extraConfig = {
      core = {
        editor = "nvim";
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      push.autoSetupRemote = true;
      pull.rebase = true;
      init.defaultBranch = "main";

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


          Signed-off-by: ${config.programs.git.userName} <${config.programs.git.userEmail}>
        ''}";
      };
      credential.helper = "!gh auth git-credential";
    };
  };
}

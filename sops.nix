{
  ...
}: {
  sops = {
    defaultSopsFile = hosts/linux/cerulean-statistician/secrets.yaml;
    age.keyFile = "/etc/sops/age/host-keys.txt";

    secrets = {
      simple = {};

      "git/signing/signature" = {};
      "git/signing/pub" = {};
      "git/signing/private" = {};

      "git/github/pub" = {};
      "git/github/private" = {};

      "git/gitlab/pub" = {};
      "git/gitlab/private" = {};
    };
  };
}

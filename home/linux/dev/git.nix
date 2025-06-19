{meta, ...}: let
  signingKey =
    if meta.name == "cerulean-statistician"
    then "0xAD95B5A6E8B4ABFB"
    else if meta.name == "heliotrope-secretary"
    then "0x0F3BD0224A3D4F46"
    else "";
in {
  programs.git = {
    aliases = {
      open = "!sh -c 'url=$(git config --get remote.origin.url); if [[ $url == git@* ]]; then url=$(echo $url | sed -e \"s/:/\\//\" -e \"s/^git@/https:\\/\\//\" -e \"s/\\.git$//\"); fi; xdg-open $url'";
    };

    signing.key = signingKey;
  };
}

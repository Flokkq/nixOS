{meta, ...}: let
  signingKey =
    if meta.name == "cerulian-statistician"
    then "0xC2D6F266F19FDE26"
    else if meta.name == "heliotrope-secretary"
    then "0x0F3BD0224A3D4F46"
    else "";
in {
  programs.git = {
    aliases = {
      open = "!sh -c 'xdg-open $(git config --get remote.origin.url | sed -e s/.git$//)'";
    };

    signing.key = signingKey;
  };
}

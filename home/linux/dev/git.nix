{...}: {
  programs.git = {
    aliases = {
      open = "!sh -c 'xdg-open $(git config --get remote.origin.url | sed -e s/.git$//)'";
    };

    signing.key = "0xC2D6F266F19FDE26";
  };
}

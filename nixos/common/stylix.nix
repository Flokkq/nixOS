{
  lib,
  meta,
  ...
}: {
  config = {
    stylix = {
      enable = true;
      base16Scheme = meta.theme.scheme;
      polarity = lib.mkDefault (meta.theme.polarity or "dark");
      image = meta.theme.wallpaper;
      cursor = meta.theme.cursor or {};
      fonts = lib.mkMerge [
        (meta.theme.fonts or {})
        {
          sizes = {
            applications = 11;
            terminal = 11;
            desktop = 11;
            popups = 11;
          };
        }
      ];
    };
  };
}

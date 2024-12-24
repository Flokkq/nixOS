{pkgs}: {
  sketchybarAppFont = pkgs.stdenv.mkDerivation {
    pname = "sketchybar-app-font";
    version = "2.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf";
      sha256 = "006gfal3iaji572rsb6z5ysy7nyzk3vxsp18ihsm9hss58h5bwlx";
    };

    # skip since we download 1 file
    unpackPhase = "true";

    installPhase = ''
      mkdir -p $out/share/fonts
      cp $src $out/share/fonts/sketchybar-app-font.ttf
    '';
  };
}

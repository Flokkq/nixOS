{pkgs, ...}: let
  cpuLoadBinary = pkgs.stdenv.mkDerivation {
    pname = "cpu_load";
    version = "1.0";
    src = ./sketchybar/helpers/event_providers;
    buildInputs = [pkgs.clang pkgs.gnumake];
    buildPhase = ''
      cd cpu_load
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp cpu_load/bin/cpu_load $out/bin/ || cp cpu_load/cpu_load $out/bin/ || cp bin/cpu_load $out/bin/
    '';
  };

  networkLoadBinary = pkgs.stdenv.mkDerivation {
    pname = "network_load";
    version = "1.0";
    src = ./sketchybar/helpers/event_providers;
    buildInputs = [pkgs.clang pkgs.gnumake];
    buildPhase = ''
      cd network_load
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp network_load/bin/network_load $out/bin/ || cp network_load/network_load $out/bin/ || cp bin/network_load $out/bin/
    '';
  };

  menusBinary = pkgs.stdenv.mkDerivation {
    pname = "menus";
    version = "1.0";
    src = ./sketchybar/helpers;

    nativeBuildInputs = [pkgs.clang pkgs.gnumake];

    NIX_CFLAGS_COMPILE = ''
      -F$SDKROOT/System/Library/Frameworks
      -F$SDKROOT/System/Library/PrivateFrameworks
    '';

    NIX_LDFLAGS = ''
      -framework Carbon
      -framework SkyLight
    '';

    buildPhase = ''
      cd menus
      make
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp menus/bin/menus $out/bin/ || cp menus/menus $out/bin/ || cp bin/menus $out/bin/
    '';
  };
in {
  inherit cpuLoadBinary networkLoadBinary menusBinary;
}

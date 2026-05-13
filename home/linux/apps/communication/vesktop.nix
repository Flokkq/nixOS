{lib, ...}: let
  vencordSettings = builtins.fromJSON (builtins.readFile ../../../apps/communication/vesktop.json);
in {
  programs.vesktop = {
    enable = true;
    package = null;

    vencord.settings =
      vencordSettings
      // {
        enabledThemes = lib.mkForce ["stylix.css"];
        themeLinks = lib.mkForce [];
        useQuickCss = lib.mkForce false;
      };
  };
}

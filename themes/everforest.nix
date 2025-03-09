{lib ? import ./lib.nix}:
lib.makeTheme {
  name = "everforest-hard";
  colors = {
    fg = "#D3C6AA";
    bg = "#1E2326";
    bg1 = "#2E282C";
    bg2 = "#274145";
    bg3 = "#414B50";
    red = "#E67E80";
    orange = "#E69875";
    yellow = "#DBBC7F";
    green = "#A7C080";
    blue = "#7FBBB3";
    aqua = "#83C092";
    purple = "#D699B6";
    gray = "#7A8478";
    border = "#829181";
    accent = "#83C092";
    error = "#E67E80";
    warning = "#E69875";
    success = "#A7C080";
    info = "#7FBBB3";
  };
}

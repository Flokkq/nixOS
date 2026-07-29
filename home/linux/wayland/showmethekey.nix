{lib, ...}: {
  dconf.settings."one/alynx/showmethekey" = {
    first-time = false;
    active = true;
    clickable = false;
    paused = false;
    show-shift = true;
    show-keyboard = true;
    show-mouse = false;
    draw-border = false;
    hide-visible = false;
    mode = "compact";
    alignment = "center";
    width = lib.gvariant.mkDouble 600.0;
    height = lib.gvariant.mkDouble 90.0;
    margin-ratio = lib.gvariant.mkDouble 0.25;
    timeout = lib.gvariant.mkDouble 1200.0;
    layout = "us";
    variant = "";
  };
}

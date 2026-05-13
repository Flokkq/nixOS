{config, ...}: {
  stylix.targets.gtk.enable = true;
  gtk = {
    enable = true;

    gtk3 = {
      bookmarks = [
        "file:///flokkq/user"
        "file:///flokkq/user/downloads"
        "file:///flokkq/user/media/pictures/screenshots"
        "file:///mnt/media1"
        "file:///mnt/media2"
        "file:///mnt/media3"
        "file:///mnt/media4"
      ];

      # <https://docs.gtk.org/gtk3/class.Settings.html#properties>
      extraConfig = {
        # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };

    gtk4 = {
      theme = config.gtk.theme;

      # <https://docs.gtk.org/gtk4/class.Settings.html#properties>
      extraConfig = {
        # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };
  };
}

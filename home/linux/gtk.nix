{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = ["normal"];
    };

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
        gtk-application-prefer-dark-theme = 1;

        # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };

    gtk4 = {
      # <https://docs.gtk.org/gtk4/class.Settings.html#properties>
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;

        # Remove the app menu (Minimize / Maximize / Close buttons) from the title bar
        gtk-decoration-layout = "menu:none";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };
  };
}

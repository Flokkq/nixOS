_: {
  system.defaults.dock = {
    autohide = true;
    mru-spaces = false; # disable rearragne spaces based on most recent use
    show-recents = false; # disable recent apps
    static-only = false; # disable open apps
    showhidden = false;

    magnification = true;
    largesize = 76;
    tilesize = 48;

    persistent-apps = [
      "/Applications/Safari.app"
      "/System/Applications/Utilities/Terminal.app"
    ];

    persistent-others = [
      "/Users/Flokkq/Downloads"
    ];

    # customize Hot Corners
    wvous-tl-corner = 2; # top-left - Mission Control
    wvous-tr-corner = 13; # top-right - Lock Screen
    wvous-bl-corner = 3; # bottom-left - Application Windows
    wvous-br-corner = 4; # bottom-right - Desktop
  };
}

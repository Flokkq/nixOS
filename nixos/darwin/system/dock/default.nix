_: {
  imports = [
    ./module.nix
  ];

  system.defaults.dock = {
    autohide = true;
    mru-spaces = false; # disable rearragne spaces based on most recent use
    show-recents = false; # disable recent apps
    static-only = false; # disable open apps
    showhidden = false;

    magnification = true;
    largesize = 76;
    tilesize = 48;

    # customize Hot Corners
    wvous-tl-corner = 2; # top-left - Mission Control
    wvous-tr-corner = 13; # top-right - Lock Screen
    wvous-bl-corner = 3; # bottom-left - Application Windows
    wvous-br-corner = 4; # bottom-right - Desktop
  };

  local.dock = {
    enable = true;
    entries = [
      {path = "/System/Applications/Messages.app/";}
      {path = "/System/Applications/Facetime.app/";}
      {path = "/System/Applications/Music.app/";}
      {path = "/System/Applications/News.app/";}
      {path = "/System/Applications/Photos.app/";}
      {path = "/System/Applications/Photo Booth.app/";}
      {path = "/System/Applications/Home.app/";}
      {path = "/Applications/iPhone Mirroring.app/";}
      {
        path = "/Users/flokkq/Downloads/";
        section = "others";
        options = "--sort dateadded --view fan --display folder";
      }
    ];
  };
}

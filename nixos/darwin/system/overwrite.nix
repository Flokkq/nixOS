# Customize settings that not supported by nix-darwin directly
# see the source code of this project to get more undocumented options:
#    https://github.com/rgcr/m-cli
#
# All custom entries can be found by running `defaults read` command.
# or `defaults read xxx` to read a specific domain.
_: {
  system.defaults.CustomUserPreferences = {
    ".GlobalPreferences" = {
      # automatically switch to a new space when switching to the application
      AppleSpacesSwitchOnActivate = true;
    };

    NSGlobalDomain = {
      # Add a context menu item for showing the Web Inspector in web views
      WebKitDeveloperExtras = true;

      "AppleSpacesSwitchOnActivate" = true; # This may be helpful in conjunction

      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.spaces" = {
        "spans-displays" = 0; # Display have seperate spaces
      };
      "com.apple.WindowManager" = {
        EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
        StandardHideDesktopIcons = 0; # Show items on desktop
        HideDesktop = 0; # Do not hide items on desktop & stage manager
        StageManagerHideWidgets = 0;
        StandardHideWidgets = 0;
      };
      "com.apple.screensaver" = {
        # Require password immediately after sleep or screen saver begins
        askForPassword = 1;
        askForPasswordDelay = 0;
      };
      "com.apple.screencapture" = {
        location = "~/Desktop";
        type = "png";
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      # Prevent Photos from opening automatically when devices are plugged in
      "com.apple.ImageCapture".disableHotPlug = true;
    };
  };
}

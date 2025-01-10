_: {
  system.defaults.finder = {
    FXPreferredViewStyle = "clmv"; # columnview in finder
    _FXShowPosixPathInTitle = true; # show full path in finder title
    AppleShowAllExtensions = true; # show all file extensions
    FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
    QuitMenuItem = true; # enable quit menu item
    ShowPathbar = true; # show path bar
    ShowStatusBar = true; # show status bar
    CreateDesktop = false;
  };

  system.defaults.CustomUserPreferences.NSGlobalDomain."com.apple.finder" = {
    ShowExternalHardDrivesOnDesktop = true;
    ShowHardDrivesOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    ShowRemovableMediaOnDesktop = true;
    _FXSortFoldersFirst = true;
    # When performing a search, search the current folder by default
    FXDefaultSearchScope = "SCcf";
  };
}

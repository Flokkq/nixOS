_: {
  system.defaults.NSGlobalDomain = {
    # `defaults read NSGlobalDomain "xxx"`
    "com.apple.swipescrolldirection" = true; # enable natural scrolling(default to true)
    "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key
    AppleInterfaceStyle = "Dark"; # dark mode
    AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
    ApplePressAndHoldEnabled = true; # enable press and hold

    # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
    # This is very useful for vim users, they use `hjkl` to move cursor.
    # sets how long it takes before it starts repeating.
    InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
    # sets how fast it repeats once it starts.
    KeyRepeat = 3; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

    NSAutomaticCapitalizationEnabled = false; # disable auto capitalization
    NSAutomaticDashSubstitutionEnabled = false; # disable auto dash substitution
    NSAutomaticPeriodSubstitutionEnabled = false; # disable auto period substitution
    NSAutomaticQuoteSubstitutionEnabled = false; # disable auto quote substitution
    NSAutomaticSpellingCorrectionEnabled = false; # disable auto spelling correction
    NSNavPanelExpandedStateForSaveMode = true; # expand save panel by default
    NSNavPanelExpandedStateForSaveMode2 = true;

    _HIHideMenuBar = true; # hide menu bar
  };
}

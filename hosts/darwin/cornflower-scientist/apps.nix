{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mkalias
    iterm2
    lua54Packages.lua
  ];

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      Xcode = 497799835;
      GoodNotes = 1444383602;
      Excel = 462058435;
      Word = 462054704;
      PowerPoint = 462062816;
      WhatsApp = 310633997;
      ParallelsDesktop = 1085114709;
      KeyNote = 409183694;
      WireGuard = 1451685025;
    };

    taps = [
      "homebrew/services"
      "koekeishiya/formulae"
      "FelixKratz/formulae"
    ];

    # `brew install`
    brews = [
      "httpie"
      "lua"
      "mas"
      "switchaudio-osx"
      "nowplaying-cli"
      "wireguard-tools"

      "koekeishiya/formulae/yabai"
      "koekeishiya/formulae/skhd"

      "FelixKratz/formulae/borders"
      "FelixKratz/formulae/svim"
    ];

    # `brew install --cask`
    casks = [
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "alt-tab"
      "docker"
      "ghidra" # broken nixpkgs binarry
      "balenaetcher"
      "sublime-text" # no nixpkgs darwin binary
      "1password"
      "1password-cli"
      "safe-exam-browser"
      "raspberry-pi-imager"
      "chatgpt"
      "homerow"
      "burp-suite"
      "karabiner-elements"
      "anydesk"
      "wireshark"
      "figma"
    ];
  };
}

{
  pkgs,
  config,
  ...
}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    eza
    oh-my-zsh
    fzf
    ripgrep
    cloc
    docker
    bat
    gh
    neofetch
    jq
    typioca
    mkalias
    iterm2
    vesktop
    gcc
    gnumake
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
      while read src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      Xcode = 497799835;
      GoodNotes = 1444383602;
      _1Password = 1333542190; # broken nixpkgs binary
      Excel = 462058435;
      Word = 462054704;
      PowerPoint = 462062816;
      WhatsApp = 310633997;
      ParallelsDesktop = 1085114709;
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

      "koekeishiya/formulae/yabai"
      "koekeishiya/formulae/skhd"

      "FelixKratz/formulae/sketchybar"
      "FelixKratz/formulae/borders"
      "FelixKratz/formulae/svim"
    ];

    # `brew install --cask`
    casks = [
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "google-chrome"
      "alt-tab"
      "docker"
      "ghidra" # broken nixpkgs binarry
      "balenaetcher"
      "sublime-text" # no nixpkgs darwin binary
    ];
  };
}

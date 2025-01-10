_: {
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
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
      "desktoppr"
    ];
  };
}

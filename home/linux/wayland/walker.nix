_: {
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      placeholders."default" = {
        input = "Search";
        list = "Example";
      };
      providers.prefixes = [
        {
          provider = "websearch";
          prefix = "+";
        }
        {
          provider = "providerlist";
          prefix = "_";
        }
        {
          provider = "1password";
          prefix = ";";
        }
      ];
    };
  };

  programs.elephant = {
    enable = true;

    # only enable providers you actually want
    providers = [
      "bluetooth"
      "bookmarks"
      "calc"
      "clipboard"
      "desktopapplications"
      "files"
      "menus"
      "providerlist"
      "runner"
      "snippets"
      "symbols"
      "todo"
      "unicode"
      "websearch"
      "windows"
      "1password"
    ];

    # settings = {
    #   auto_detect_launch_prefix = false;
    # };
  };
}

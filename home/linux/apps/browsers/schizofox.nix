{inputs, ...}: {
  imports = [inputs.schizofox.homeManagerModule];
  programs.schizofox = {
    enable = true;

    search = {
      defaultSearchEngine = "Google";
      removeEngines = ["Brave" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
      searxUrl = "https://searx.be";
      searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
      addEngines = [];
    };

    security = {
      sanitizeOnShutdown = false;
      sandbox = true;
      userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
    };

    misc = {
      drmFix = true;
      disableWebgl = false;
      # startPageURL = "file://${toString ./startpage.html}";
      contextMenu.enable = true;
    };

    extensions = {
      simplefox.enable = true;
      darkreader.enable = true;

      extraExtensions = {
        "webextension@metamask.io".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
        "uBlock0@raymondhill.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        "vimium-ff@gavinsharp.github.com".install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium/latest.xpi";
      };
    };

    bookmarks = [
      {
        Title = "Github";
        URL = "https://www.github.com/";
        Favicon = "https://www.gitub.com/favicon.ico";
        Placement = "toolbar";
      }
    ];
  };
}

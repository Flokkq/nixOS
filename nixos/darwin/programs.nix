_: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };
  };
}

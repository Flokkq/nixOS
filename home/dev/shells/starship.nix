{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      custom.nixos = {
        command = "echo -n   25.11";
        when = "true";
        format = "using [$output](bold blue)";
      };

      format = "$directory$custom $all"; # Add the custom module after the directory listing

      buf = {
        disabled = true;
      };
      character = {
        success_symbol = "[󰘧](bold green)";
        error_symbol = "[󰘧](bold red)";
      };
      directory = {
        truncate_to_repo = false;
      };
      dotnet = {
        detect_files = [
          "global.json"
          "Directory.Build.props"
          "Directory.Build.targets"
          "Packages.props"
        ];
      };
      git_branch = {
        symbol = " ";
        truncation_length = 18;
      };
      golang = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
      package = {
        disabled = false;
      };
    };
  };
}

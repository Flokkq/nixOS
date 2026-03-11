{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        kamadorueda.alejandra
        # catppuccin.catppuccin-vsc
        vscodevim.vim
      ];

      userSettings = {
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        # "workbench.colorTheme" = "Catppuccin Mocha";
      };
    };

    mutableExtensionsDir = false;
    package = pkgs.vscode;
  };
}

{pkgs, ...}: let
  downloadPlugin = {
    name,
    version,
    url,
    hash,
  }:
    pkgs.stdenv.mkDerivation {
      inherit name version;
      src = pkgs.fetchzip {
        inherit url hash;
      };
      installPhase = ''
        mkdir -p $out
        cp -r . $out
      '';
    };

  catppuccin = downloadPlugin {
    name = "catppuccin";
    version = "3.4.0";
    url = "https://downloads.marketplace.jetbrains.com/files/18682/633467/Catppuccin_Theme-3.4.0.zip";
    hash = "sha256-a26wxw2/pJHt3SwNl0lzD/koKP77EhWpfNe3vw2rBco=";
  };
in {
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.datagrip [
      catppuccin
    ])

    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [
      catppuccin
    ])

    (jetbrains.plugins.addPlugins jetbrains.rider [
      catppuccin
    ])
  ];

  home.file.".ideavimrc".text = ''
    let mapleader = ' '
    nnoremap <leader> <Nop>
    set clipboard+=unnamedplus

    nnoremap K :action QuickJavaDoc<CR>

    nnoremap <leader>d :action ShowErrorDescription<CR>
    nnoremap <leader>ca :action ShowIntentionActions<CR>
    nnoremap <leader>rn :action RenameElement<CR>

    nnoremap gd :action GotoDeclaration<CR>
    nnoremap gD :action GotoTypeDeclaration<CR>
    nnoremap gi :action GotoImplementation<CR>
    nnoremap gf :action OpenFile<CR>

    nnoremap H ^
    nnoremap L $
  '';

  home.file.".config/JetBrains/IntelliJIdea2024.1/options/ui.lnf.xml".text = ''
    <application>
      <component name="LafManager">
        <laf class-name="Catppuccin Mocha" />
      </component>
    </application>
  '';

  home.file.".config/JetBrains/IntelliJIdea2024.1/options/editor.xml".text = ''
    <application>
      <component name="EditorColorsManager">
        <global_color_scheme name="Catppuccin Mocha" />
      </component>
    </application>
  '';
}

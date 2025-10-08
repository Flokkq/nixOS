{pkgs, ...}: {
  environment.systemPackages = with pkgs;
  # tools
    [
      gcc
      gnumake
      rustup
      go_1_24
      air
      nodejs
      yarn
      nil
      alejandra
      rustup
    ]
    # language servers
    # ../home/dev/editors/nvim/nvim/lua/plugins/lsp.lua
    ++ [
      zls
      rust-analyzer
      tinymist
      nixd
      bash-language-server
      vscode-langservers-extracted
      typescript-language-server
      tailwindcss-language-server
      marksman
      lua-language-server
      sqls
      yaml-language-server
    ];
}

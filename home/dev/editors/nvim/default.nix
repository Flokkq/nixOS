{
  config,
  pkgs,
  ...
}: let
  nvimConfig = "${config.home.homeDirectory}/developer/nixOS/home/dev/editors/nvim/nvim";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      base16-nvim
    ];

    initLua = ''
      local config_path = "${nvimConfig}"

      vim.opt.runtimepath:prepend(config_path)

      package.path = table.concat({
        config_path .. "/lua/?.lua",
        config_path .. "/lua/?/init.lua",
        package.path,
      }, ";")

      dofile(config_path .. "/init.lua")
    '';
  };

  stylix.targets.neovim = {
    enable = true;
    plugin = "mini.base16";

    transparentBackground = {
      numberLine = true;
      signColumn = true;
    };
  };
}

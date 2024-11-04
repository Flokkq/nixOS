-- This will backfire soon enough :/
-- TODO:  https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/lua.section.md
local lua_path = "/nix/store/f6ani7d3cq70fd3j0qygbh08ms600xdh-SketchyBarLua-main/share/lua/5.4"
if lua_path then
  package.cpath = package.cpath .. ";" .. lua_path .. "/?.so"
else
  error("SB_LUA_PATH environment variable is not set")
end

-- Ensure the module is loaded correctly
sbar = require("sketchybar")

-- This will backfire soon enough :/
-- TODO:  https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/lua.section.md
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"

os.execute("(cd helpers && make)")

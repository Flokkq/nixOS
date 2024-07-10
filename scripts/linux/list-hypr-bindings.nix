{ pkgs, ... }:

pkgs.writeShellScriptBin "list-hypr-bindings" ''
  yad --width=800 --height=650 \
  --center \
  --fixed \
  --title="Hyprland Keybindings" \
  --no-buttons \
  --list \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --timeout=90 \
  --timeout-indicator=right \
  " = Windows/Super/CAPS LOCK" "Modifier Key, used for keybindings" "Doesn't really execute anything by itself." \
  " + SPACE" "App Launcher" "wofi --show drun" \
  " + SHIFT + SPACE" "Terminal" "kitty" \
  " + Q" "Kill Focused Window" "killactive" \
  " + SHIFT + W" "Search Websites Like Nix Packages" "web-search" \
  " + SHIFT + N" "Reload SwayNC Styling" "swaync-client -rs" \
  " + W" "Launch Web Browser" "brave" \
  " + S" "Take Screenshot" "screenshootin" \
  " + D" "Launch Discord" "discord" \
  " + N" "Launch New File Browser Window" "dolphin" \
  " + M" "Launch Spotify" "spotify" \
  " + P" "Pseudo Tiling" "pseudo" \
  " + SHIFT + I" "Toggle Split Direction" "togglesplit" \
  " + F" "Toggle Focused Fullscreen" "fullscreen" \
  " + SHIFT + F" "Toggle Focused Floating" "fullscreen" \
  " + SHIFT + C" "Quit / Exit Hyprland" "exit" \
  " + H" "Move Focus To Window On The Left" "movefocus,l" \
  " + L" "Move Focus To Window On The Right" "movefocus,r" \
  " + K" "Move Focus To Window On The Up" "movefocus,u" \
  " + J" "Move Focus To Window On The Down" "movefocus,d" \
  " + Left" "Move Focus To Window On The Left" "movefocus,l" \
  " + Right" "Move Focus To Window On The Right" "movefocus,r" \
  " + Up" "Move Focus To Window On The Up" "movefocus,u" \
  " + Down" "Move Focus To Window On The Down" "movefocus,d" \
  " + SHIFT + Left" "Move Focused Window Left" "movewindow,l" \
  " + SHIFT + Right" "Move Focused Window Right" "movewindow,r" \
  " + SHIFT + Up" "Move Focused Window Up" "movewindow,u" \
  " + SHIFT + Down" "Move Focused Window Down" "movewindow,d" \
  " + 1-0" "Move To Workspace 1 - 10" "workspace,X" \
  " + SHIFT + 1-0" "Move Focused Window To Workspace 1 - 10" "movetoworkspace,X" \
  " + mouse_down" "Switch to Next Workspace" "workspace,e+1" \
  " + mouse_up" "Switch to Previous Workspace" "workspace,e-1" \
  " + ENTER" "Toggle Special Workspace" "togglespecialworkspace" \
  " + SHIFT + ENTER" "Send Focused Window To Special Workspace" "movetoworkspace,special" \
  "ALT + TAB" "Cycle Window Focus + Bring To Front" "cyclenext & bringactivetotop" \
  ""
''

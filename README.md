<h2 align="center">:crab: Flokkq's Nix Config :crab:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
	<a href="https://github.com/flokkq/nixOS/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/flokkq/nixOS?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-24.05-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
</p>

This repository is home to the nix code that builds my systems:

1. NixOS Desktop: NixOS with home-manager, hyprland, etc.
2. MacBook-Pro 2021: nix-darwin sharing the same home-manager configuration with NixOS Desktop.

See [./hosts](./hosts) for details of each host.

## Components

|                             | NixOS (Wayland)                                   | macOS                                  |
| --------------------------- | :------------------------------------------------ | :-------------------------------------- |
| **Window Manager**          | [Hyprland][Hyprland]                              | [Yabai][Yabai]                          |
| **Terminal Emulator**       | [Tmux][Tmux] + [Kitty][Kitty]                     | [Tmux][Tmux] + [iTerm][iTerm]           |
| **Bar**                     | [Waybar][Waybar]                                  | [SketchyBar][SketchyBar]                |
| **Application Launcher**    | [Wofi][Wofi]                                      | [Raycast][Raycast]                      |
| **Display Manager**         | [Greetd][Greetd]                                  | Native macOS                            |
| **Color Scheme**            | [Catppuccin][Catppuccin] + [Rosepine][Rosepine]   | Default macOS                           |
| **System resource monitor** | [Btop][Btop]                                      | [Btop][Btop]                            |
| **File Manager**            | [Nautilus][Nautilus]                              | Finder                                  |
| **Shell**                   | [Zsh][Zsh]                                        | [Zsh][Zsh]                              |
| **Music Player**            | [Spicetify][Spicetify]                            | Spotify                                 |
| **Text Editor**             | [Neovim][Neovim]                                  | [Neovim][Neovim]                        |
| **Fonts**                   | [Nerd fonts][Nerd fonts]                          | [Nerd fonts][Nerd fonts]                |

## Future Improvements and Known Issues

This configuration is a work in progress. Several components, particularly on the darwin side, are still incomplete. Whilst linux is almost done Waybar and Hyprland are prone to random crashes, and many configurations could be significantly improved.

If you're interested in the ongoing development or want to see what's planned, please check out the [Issues](https://github.com/flokkq/dotfiles/issues) page. Suggestions are welcome!

## Documentation

For detailed, platform-specific documentation, refer to the following:

- [Linux documentation](/hosts/linux/README.md)
- [Darwin (macOS) documentation](/hosts/darwin/README.md)

These will guide you through the specifics of each setup.

## How to Deploy this Flake?

> [!WARNING]
> :red_circle: **IMPORTANT**: This configuration is still under development, making it **UNSAFE AND NOT RECOMMENDED** for general use. Proceed at your own risk!  
> That said, if you're feeling adventurous, you can check out the [untested install guide](INSTALL.md) for more details. 

[Hyprland]: https://github.com/hyprwm/Hyprland
[Yabai]: https://github.com/koekeishiya/yabai
[Tmux]: https://github.com/tmux/tmux
[Kitty]: https://github.com/kovidgoyal/kitty
[iTerm]: https://iterm2.com/
[Waybar]: https://github.com/Alexays/Waybar
[SketchyBar]: https://github.com/FelixKratz/SketchyBar
[Wofi]: https://hg.sr.ht/~scoopta/wofi
[Raycast]: https://www.raycast.com/
[Greetd]: https://wiki.alpinelinux.org/wiki/Greetd
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Rosepine]: https://github.com/rose-pine/gtk
[Btop]: https://github.com/aristocratos/btop
[Nautilus]: https://gitlab.gnome.org/GNOME/nautilus
[Zsh]: https://www.zsh.org/
[Spicetify]: https://github.com/khanhas/spicetify-cli
[Neovim]: https://github.com/neovim/neovim
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts

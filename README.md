<h2 align="center">:crab: Flokkq's Nix Config :crab:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
	<a href="https://github.com/Flokkq/nixos/actions">
        <img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/Flokkq/nixOS/check.yml?style=for-the-badge&logo=starship&color=DD7878&logoColor=D9E0EE&labelColor=302D41">
	<a href="https://github.com/flokkq/nixOS/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/flokkq/nixOS?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-24.11-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
</p>

This repository is home to the nix code that builds my systems:

1. NixOS Desktop: NixOS with impermanence, hyprland, etc.
2. MacBook-Pro 2021: nix-darwin sharing the same configuration.
3. Lenovo IdeaPad Y500-2013: experimental x86-64 sometimes CTF machine.
4. Why are there no 14" frameworks?!

See [./hosts](./hosts) for details of each host.

## Components

|                             | NixOS (Wayland)                                      | NixOS (Xorg)                                         | macOS                                   |
| --------------------------- | :--------------------------------------------------- | :--------------------------------------------------- | :-------------------------------------- |
| **Window Manager**          | [Hyprland][Hyprland]                                 | [Bspwm][Bspwm]                                       | [Yabai][Yabai]                          |
| **Terminal Emulator**       | [Tmux][Tmux] + [Ghostty][Ghostty]                    | [Tmux][Tmux] + [Ghostty][Ghostty]                    | [Tmux][Tmux] + [Ghostty][Ghostty]       |
| **Bar**                     | [Waybar][Waybar]                                     | [Polybar][Polybar]                                   | [SketchyBar][SketchyBar]                |
| **Application Launcher**    | [Wofi][Wofi]                                         | [Rofi][Rofi]                                         | [Raycast][Raycast]                      |
| **Display Manager**         | [Greetd][Greetd]                                     | [Greetd][Greetd]                                     | Native macOS                            |
| **Color Scheme**            | [Stylix][Stylix]                             | [Stylix][Stylix]                             | Default macOS + [Stylix][Stylix]|
| **System resource monitor** | [Btop][Btop]                                         | [Btop][Btop]                                         | [Btop][Btop]                            |
| **File Manager**            | [Nautilus][Nautilus]                                 | [Nautilus][Nautilus]                                 | Finder                                  |
| **Shell**                   | [Zsh][Zsh]                                           | [Zsh][Zsh]                                           | [Zsh][Zsh]                              |
| **Music Player**            | [Spicetify][Spicetify]                               | [Spicetify][Spicetify]                               | [Spicetify][Spicetify]                  |
| **Text Editor**             | [Neovim][Neovim]                                     | [Neovim][Neovim]                                     | [Neovim][Neovim]                        |
| **Fonts**                   | [Nerd fonts][Nerd fonts]                             | [Nerd fonts][Nerd fonts]                             | [Nerd fonts][Nerd fonts]                |

<details>
    <summary>Hyprland showcase</summary>
    <video controls src=".media/hyprland.mp4" width="800">
        Your browser does not support the video tag.
    </video>
</details>


<details>
    <summary>Bspwm showcase</summary>
    <p>Still WIP :/</p>
</details>

<details>
    <summary>MacOS showcase</summary>
    <video controls src=".media/darwin.mp4" width="800">
        Your browser does not support the video tag.
    </video>
</details>

## Documentation

For detailed, platform-specific documentation, refer to the following:

- [Linux documentation](hosts/linux/README.md)
- [Darwin (macOS) documentation](hosts/darwin/README.md)

These will guide you through the specifics of each setup.

## How to Deploy this Flake?

> [!WARNING]
> :red_circle: **IMPORTANT**: This configuration is for myself, making it **NOT RECOMMENDED** for general use.
> That said, if you're feeling adventurous, you can check out the [install guide](INSTALL.md) for more details.

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
[Ghostty]: https://ghostty.org
[Bspwm]: https://github.com/baskerville/bspwm
[Polybar]: https://github.com/polybar/polybar
[Rofi]: https://github.com/davatorium/rofi
[Stylix]: https://github.com/nix-community/stylix

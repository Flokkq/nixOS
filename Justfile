# just is a command runner, Justfile is very similar to Makefile, but simpler.

# Use nushell for shell commands
# To usage this justfile, you need to enter a shell with just & nushell installed:
# 
#   nix shell nixpkgs#just nixpkgs#nushell
set shell := ["nu", "-c"]

utils_nu := absolute_path("utils.nu")

############################################################################
#
#  Common commands(suitable for all machines)
#
############################################################################

# List all the just commands
default:
    @just --list

# Run eval tests
[group('nix')]
test:
  nix eval .#evalTests --show-trace --print-build-logs --verbose

# Update all the flake inputs
[group('nix')]
up:
  nix flake update

# Update specific input
# Usage: just upp nixpkgs
[group('nix')]
upp input:
  nix flake update {{input}}

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Open a nix shell with the flake
[group('nix')]
repl:
  nix repl -f flake:nixpkgs

# remove all generations older than 7 days
# on darwin, you may need to switch to root user to run this command
[group('nix')]
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Garbage collect all unused nix store entries
[group('nix')]
gc:
  # garbage collect all unused nix store entries(system-wide)
  sudo nix-collect-garbage --delete-older-than 7d
  # garbage collect all unused nix store entries(for the user - home-manager)
  # https://github.com/NixOS/nix/issues/8508
  nix-collect-garbage --delete-older-than 7d

# Enter a shell session which has all the necessary tools for this flake
[linux]
[group('nix')]
shell:
  nix shell nixpkgs#git nixpkgs#neovim nixpkgs#colmena

# Enter a shell session which has all the necessary tools for this flake
[macos]
[group('nix')]
shell:
  nix shell nixpkgs#git nixpkgs#neovim

[group('nix')]
fmt:
  # format the nix files in this repo
  nix fmt

# Show all the auto gc roots in the nix store
[group('nix')]
gcroot:
  ls -al /nix/var/nix/gcroots/auto/

############################################################################
#
#  NixOS Desktop related commands
#
############################################################################

[linux]
[group('desktop')]
hypr mode="default":
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  nixos-switch ai-hyprland {{mode}}

[linux]
[group('desktop')]
s-hypr mode="default":
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  nixos-switch shoukei-hyprland {{mode}}

############################################################################
#
#  Darwin related commands 
#
############################################################################

[macos]
[group('desktop')]
darwin-set-proxy:
  sudo python3 scripts/darwin_set_proxy.py
  sleep 1sec

[macos]
[group('desktop')]
darwin-rollback:
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  darwin-rollback

# Reload yabai and skhd(macOS)
[macos]
[group('desktop')]
yabai-reload:
  launchctl kickstart -k "gui/502/org.nixos.yabai";
  launchctl kickstart -k "gui/502/org.nixos.skhd"; 

############################################################################
#
#  Neovim related commands
#
############################################################################

[group('neovim')]
nvim-test:
  rm -rf $"($env.HOME)/.config/nvim"
  rsync -avz --copy-links --chmod=D2755,F744 home/base/tui/editors/neovim/nvim/ $"($env.HOME)/.config/nvim/"

[group('neovim')]
nvim-clean:
  rm -rf $"($env.HOME)/.config/nvim"

# =================================================
#
# Other useful commands
#
# =================================================

[group('common')]
path:
   $env.PATH | split row ":"

[linux]
[group('common')]
penvof pid:
  sudo cat $"/proc/($pid)/environ" | tr '\0' '\n'

# Remove all reflog entries and prune unreachable objects
[group('git')]
ggc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

# Amend the last commit without changing the commit message
[group('git')]
game:
  git commit --amend -a --no-edit

# Delete all failed pods
[group('k8s')]
del-failed:
  kubectl delete pod --all-namespaces --field-selector="status.phase==Failed"

[linux]
[group('services')]
list-inactive:
  systemctl list-units -all --state=inactive

[linux]
[group('services')]
list-failed:
  systemctl list-units -all --state=failed

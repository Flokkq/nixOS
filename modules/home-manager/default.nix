{config, ... }:

{
  imports = [
    # ./other.nix 
    ./apps
    ./terminals
    ./shells
    ./hypr
    ./waybar.nix
  ];
}

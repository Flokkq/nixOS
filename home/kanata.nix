{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kanata  
  ];

  programs.kanata = {
    enable = true;
  };
}

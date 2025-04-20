{pkgs, ...}: let
  bspc = "${pkgs.bspwm}/bin/bspc";
in {
  services.sxhkd = {
    enable = true;

    keybindings = {
      "ctrl + {j,k,h,l}" = "${bspc} node -f {south,north,west,east}";
      "ctrl + {s,g}" = "${bspc} monitor -f {prev,next}";

      "shift + ctrl + r" = "${bspc} node @/ -R 90";
      "shift + ctrl + {y,x}" = "${bspc} node @/ -F {horizontal,vertical}";
      "shift + ctrl + t" = "${bspc} node -t ~floating";

      "shift + ctrl + m" = "${bspc} node -t floating && ${bspc} node -r 0.0 0.0 100.0 100.0";
      "shift + ctrl + e" = "${bspc} node -B";

      "shift + ctrl + {j,k,h,l}" = "${bspc} node -s {south,north,west,east}";
      "ctrl + alt + {j,k,h,l}" = "${bspc} node -n {south,north,west,east}";
      "shift + ctrl + {s,g}" = "${bspc} node -m {prev,next} && ${bspc} monitor -f {prev,next}";
      "shift + ctrl + {p,n}" = "${bspc} node -d {prev,next} && ${bspc} desktop -f {prev,next}";
      "shift + ctrl + {1-9,0}" = "${bspc} node -d ^{1-9,0} && ${bspc} desktop -f ^{1-9,0}";

      "ctrl + alt + r" = "pkill -HUP bspwm";
    };
  };
}

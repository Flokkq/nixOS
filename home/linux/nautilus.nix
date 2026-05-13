{gst_all_1, ...}: {
  stylix.targets.gtk.enable = true;

  nixpkgs.overlays = [
    (_self: super: {
      gnome = super.gnome.overrideScope (_gself: gsuper: {
        nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
          buildInputs =
            nsuper.buildInputs
            ++ (with gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      });
    })
  ];
}

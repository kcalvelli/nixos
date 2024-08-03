{ inputs, pkgs, ...}:
rec {
  home.packages = [
    inputs.hyprcursor.packages.${pkgs.system}.hyprcursor
  ];
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
  };
  #wayland.windowManager.hyprland.settings.exec-once = [
  #  "hyprctl setcursor ${home.pointerCursor.name} ${toString home.pointerCursor.size}"
  #];
  home.sessionVariables = {
    XCURSOR_THEME = home.pointerCursor.name;
    XCURSOR_SIZE = toString home.pointerCursor.size;
    HYPRCURSOR_SIZE = home.pointerCursor.size;
    HYPRCURSOR_THEME = home.pointerCursor.name;
  };
}
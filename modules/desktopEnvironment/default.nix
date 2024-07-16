{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./cosmic.nix
  ];
  cosmic.enable = true;
  gnome.enable = true;

  # Minimize how bad qt apps look
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";

  environment.systemPackages = with pkgs; [
    adw-gtk3
    qgnomeplatform-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
  ];  

  environment.sessionVariables = {
    QT_WAYLAND_DECORATION = "adwaita";
  };
}

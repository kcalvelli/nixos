{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    gnome-calendar
    gnome.gnome-control-center
    gnome.gnome-weather
    gnome-calculator
    gnome.gnome-clocks
    nautilus
    baobab
    adw-gtk3
    qgnomeplatform-qt6
    #qadwaitadecorations
    #qadwaitadecorations-qt6
    inputs.self.packages.${pkgs.system}.qadwaitadecorations
    inputs.self.packages.${pkgs.system}.qadwaitadecorations-qt6    
  ];
}
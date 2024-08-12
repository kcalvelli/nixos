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
    qadwaitadecorations
    qadwaitadecorations-qt6    
  ];
}
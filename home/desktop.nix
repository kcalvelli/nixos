{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-calendar
    gnome.gnome-control-center
    gnome.gnome-weather
    gnome-calculator
    gnome.gnome-clocks
    seahorse
    nautilus
    baobab
    adw-gtk3
    qgnomeplatform-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6    
  ];
}
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kate
    kcalc
    skanlite
    filelight
    qt6.qtwayland
    xorg.xhost
    ] ++ ( with pkgs.libsForQt5; [
    kaccounts-integration
    kaccounts-providers
    kdialog
    kio-gdrive
    accounts-qt
    utterly-round-plasma-style
  ] );

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    partition-manager.enable = true;
  };
}
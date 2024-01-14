{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pciutils
    clinfo
    glxinfo
    ripgrep
    neofetch
    helix
    vim 
    wget
    curl
    gnugrep
    xdg-user-dirs 
    desktop-file-utils
  ]; 
}
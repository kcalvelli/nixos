{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    fastfetch
    helix
    wget
    curl
    gnugrep
    vulkan-tools   
    glxinfo 
    htop
    pciutils
    clinfo
    usbutils
    aha
    wl-clipboard
    zip
    unzip
    dmidecode
  ];   
}